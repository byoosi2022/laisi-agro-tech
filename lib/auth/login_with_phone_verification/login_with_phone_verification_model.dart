import '/custom_widgets/util.dart';
import 'login_with_phone_verification_widget.dart'
    show LoginWithPhoneVerificationWidget;
import 'package:flutter/material.dart';

class LoginWithPhoneVerificationModel
    extends FlutterFlowModel<LoginWithPhoneVerificationWidget> {
  final unfocusNode = FocusNode();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  void dispose() {
    unfocusNode.dispose();
    pinCodeController?.dispose();
  }
}
