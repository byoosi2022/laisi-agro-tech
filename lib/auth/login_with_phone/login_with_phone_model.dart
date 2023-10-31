import '/custom_widgets/util.dart';
import 'login_with_phone_widget.dart' show LoginWithPhoneWidget;
import 'package:flutter/material.dart';

class LoginWithPhoneModel extends FlutterFlowModel<LoginWithPhoneWidget> {
  final unfocusNode = FocusNode();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();
  }
}
