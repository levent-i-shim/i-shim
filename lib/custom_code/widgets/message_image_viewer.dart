// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';

import 'package:i_shim/flutter_flow/flutter_flow_expanded_image_view.dart';

/// Set your widget name, define your parameter, and then add the boilerplate
/// code using the green button on the right!
class MessageImageViewer extends StatefulWidget {
  final String imagePath;
  final double height;
  final double width;

  const MessageImageViewer({
    Key? key,
    required this.imagePath,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  _MessageImageViewerState createState() => _MessageImageViewerState();
}

class _MessageImageViewerState extends State<MessageImageViewer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: FlutterFlowExpandedImageView(
              image: Image.file(
                File(widget.imagePath),
                fit: BoxFit.contain,
              ),
              allowRotation: false,
              tag: 'imageTag',
              useHeroAnimation: true,
            ),
          ),
        );
      },
      child: Image.file(
        File(widget.imagePath),
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
