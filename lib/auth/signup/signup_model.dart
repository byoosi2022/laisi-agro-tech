import 'package:flutter/material.dart';

import '/custom_widgets/util.dart';
import 'signup_widget.dart' show SignupWidget;

class SignupModel extends FlutterFlowModel<SignupWidget> {
  final unfocusNode = FocusNode();
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode1;
  TextEditingController? emailController1;
  String? Function(BuildContext, String?)? emailController1Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode2;
  TextEditingController? emailController2;
  late bool emailVisibility;
  String? Function(BuildContext, String?)? emailController2Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode1;
  TextEditingController? phoneNumberController1;
  String? Function(BuildContext, String?)? phoneNumberController1Validator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode2;
  TextEditingController? phoneNumberController2;
  String? Function(BuildContext, String?)? phoneNumberController2Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  void initState(BuildContext context) {
    passwordVisibility = false;
    emailVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

    emailFocusNode1?.dispose();
    emailController1?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();

    emailFocusNode2?.dispose();
    emailController2?.dispose();

    phoneNumberFocusNode1?.dispose();
    phoneNumberController1?.dispose();

    phoneNumberFocusNode2?.dispose();
    phoneNumberController2?.dispose();
  }
}
