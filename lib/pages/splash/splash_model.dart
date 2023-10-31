import 'package:flutter/material.dart';

import '/custom_widgets/instant_timer.dart';
import '/custom_widgets/util.dart';
import 'splash_widget.dart' show SplashWidget;

class SplashModel extends FlutterFlowModel<SplashWidget> {
  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
  }
}
