const admin = require("firebase-admin/app");
admin.initializeApp();

const processDailySalaries = require("./process_daily_salaries.js");
exports.processDailySalaries = processDailySalaries.processDailySalaries;
