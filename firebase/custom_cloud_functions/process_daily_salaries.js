const { onSchedule } = require("firebase-functions/v2/scheduler");
const admin = require("firebase-admin");

const db = admin.firestore();

exports.processDailySalaries = onSchedule(
  {
    schedule: "30 0 * * *",
    timeZone: "Europe/Istanbul",
  },
  async () => {
    const now = new Date();
    const turkishDate = new Date(
      now.toLocaleString("en-US", { timeZone: "Europe/Istanbul" }),
    );

    const day = turkishDate.getDate();
    const month = turkishDate.getMonth();
    const year = turkishDate.getFullYear();
    const daysInMonth = new Date(year, month + 1, 0).getDate();
    const yesterday = new Date(year, month, day - 1);

    const pad = (n) => n.toString().padStart(2, "0");
    const formattedDate = `${pad(day)}/${pad(month + 1)}/${year}`;

    try {
      const companiesSnap = await db.collection("companies").get();

      for (const companyDoc of companiesSnap.docs) {
        const companyRef = companyDoc.ref;
        const companyId = companyDoc.id;

        const shiftsSnap = await companyRef
          .collection("workerShifts")
          .where("isAccept", "==", true)
          .where(
            "date",
            ">=",
            new Date(
              yesterday.getFullYear(),
              yesterday.getMonth(),
              yesterday.getDate(),
              0,
              0,
              0,
            ),
          )
          .where(
            "date",
            "<",
            new Date(
              yesterday.getFullYear(),
              yesterday.getMonth(),
              yesterday.getDate() + 1,
              0,
              0,
              0,
            ),
          )
          .get();

        const mesailerByUser = new Map();
        shiftsSnap.forEach((shiftDoc) => {
          const { userRef, totalValue = 0 } = shiftDoc.data();
          if (!userRef) return;
          const prev = mesailerByUser.get(userRef.path) || 0;
          mesailerByUser.set(userRef.path, prev + totalValue);
        });

        const workersSnap = await companyRef.collection("companyWorkers").get();
        const salaryByWorkPlace = new Map();
        const batch = db.batch();

        for (const workerDoc of workersSnap.docs) {
          const { salary = 0, workPlace, userRef } = workerDoc.data();
          if (!workPlace || !workPlace.id || !userRef) continue;

          const extraShiftTotal = mesailerByUser.get(userRef.path) || 0;
          const dailySalary = salary / daysInMonth;
          const totalDailyPay = dailySalary + extraShiftTotal;

          if (totalDailyPay === 0) continue;

          const prev = salaryByWorkPlace.get(workPlace.path) || {
            total: 0,
            ref: workPlace,
          };
          prev.total += totalDailyPay;
          salaryByWorkPlace.set(workPlace.path, prev);
        }

        for (const { total, ref: workPlaceRef } of salaryByWorkPlace.values()) {
          if (total === 0) continue;

          const workPlaceSnap = await workPlaceRef.get();
          const workPlaceData = workPlaceSnap.data() || {};
          const workPlaceName = workPlaceData.name || "Bilinmeyen İşyeri";

          // İş yeri bütçesini düşür
          const updatedWorkPlaceTotalMoney =
            (workPlaceData.totalMoney || 0) - total;
          const updatedWorkPlaceYearlyMoney =
            (workPlaceData.yearlyMoney || 0) - total;
          batch.update(workPlaceRef, {
            totalMoney: updatedWorkPlaceTotalMoney,
            yearlyMoney: updatedWorkPlaceYearlyMoney,
          });

          // Şirket bütçesini düşür
          const companySnap = await companyRef.get();
          const companyData = companySnap.data() || {};
          const updatedCompanyTotalMoney =
            (companyData.totalMoney || 0) - total;
          const updatedCompanyYearlyMoney =
            (companyData.yearlyMoney || 0) - total;
          batch.update(companyRef, {
            totalMoney: updatedCompanyTotalMoney,
            yearlyMoney: updatedCompanyYearlyMoney,
          });

          // İş yeri ödeme dokümanı
          const workPlacePaymentsRef = workPlaceRef
            .collection("workPlaceSalary")
            .doc();
          batch.set(workPlacePaymentsRef, {
            value: total,
            date: turkishDate,
            type: "Günlük Maaş Ödemesi",
            description: `${formattedDate} tarihli günün toplam maaş + mesai ödemesi`,
            isDelete: false,
            toWhom: "İşçi Giderleri",
          });

          // Şirket ödeme dokümanı
          const companyPaymentsRef = companyRef
            .collection("companySalary")
            .doc();
          batch.set(companyPaymentsRef, {
            value: total,
            date: turkishDate,
            type: "Günlük Maaş Ödemesi",
            description: `${workPlaceName} isimli İşYerinin ${formattedDate} tarihli günün toplam maaş + mesai ödemesi`,
            isDelete: false,
            toWhom: "İşçi Giderleri",
            workPlace: workPlaceRef,
            workPlaceSalary: workPlacePaymentsRef,
          });

          const workersForWorkPlace = workersSnap.docs.filter((doc) => {
            const data = doc.data();
            return data.workPlace?.id === workPlaceRef.id && data.userRef;
          });

          for (const workerDoc of workersForWorkPlace) {
            const { salary = 0, userRef } = workerDoc.data();
            if (!userRef) continue;

            const extraShiftTotal = mesailerByUser.get(userRef.path) || 0;
            const dailySalary = salary / daysInMonth;
            const totalPaid = dailySalary + extraShiftTotal;
            if (totalPaid === 0) continue;

            const workerPaymentDetailsCompanyRef = companyRef
              .collection("workerPaymentDetails")
              .doc();
            batch.set(workerPaymentDetailsCompanyRef, {
              userRef,
              dailySalary,
              extraShiftTotal,
              totalPaid,
              date: turkishDate,
              workPlace: workPlaceRef,
              paymentRef: companyPaymentsRef,
            });

            const workerPaymentDetailsWorkPlaceRef = workPlaceRef
              .collection("workerPaymentDetailsWorkPlace")
              .doc();
            batch.set(workerPaymentDetailsWorkPlaceRef, {
              userRef,
              dailySalary,
              extraShiftTotal,
              totalPaid,
              date: turkishDate,
              company: companyRef,
              paymentRef: workPlacePaymentsRef,
            });
          }
        }

        await batch.commit();
        console.log(
          `Şirket ${companyId} için maaş ve mesai ödemeleri başarıyla yazıldı.`,
        );
      }
    } catch (error) {
      console.error("Maaş ödeme fonksiyonunda hata oluştu:", error);
    }
  },
);
