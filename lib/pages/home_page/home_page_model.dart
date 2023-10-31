import 'package:flutter/material.dart';

import '/custom_widgets/util.dart';
import 'home_page_widget.dart' show HomePageWidget;

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  final unfocusNode = FocusNode();

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }
}
