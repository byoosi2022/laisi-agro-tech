import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/custom_widgets/theme.dart';
import '/custom_widgets/util.dart';
import '/custom_widgets/widgets.dart';
import 'signup_model.dart';

export 'signup_model.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  late SignupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignupModel());

    _model.firstNameController ??= TextEditingController();
    _model.firstNameFocusNode ??= FocusNode();
    _model.lastNameController ??= TextEditingController();
    _model.lastNameFocusNode ??= FocusNode();
    _model.emailController1 ??= TextEditingController();
    _model.emailFocusNode1 ??= FocusNode();
    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
    _model.emailController2 ??= TextEditingController();
    _model.emailFocusNode2 ??= FocusNode();
    _model.phoneNumberController1 ??= TextEditingController();
    _model.phoneNumberFocusNode1 ??= FocusNode();
    _model.phoneNumberController2 ??= TextEditingController();
    _model.phoneNumberFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-1.00, 1.00),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/fi-sr-feather.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.01, 0.87),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/Ellipse_13.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.00, 1.00),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/Ellipse_12.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.46, -0.76),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/Ellipse_11.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, -1.00),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/Ellipse_10.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 26.0, 16.0, 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'eypgdyft' /* Create an Account */,
                            ),
                            style: CustomTheme.of(context).titleLarge.override(
                                  fontFamily: 'Inter',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              textScaleFactor:
                                  MediaQuery.of(context).textScaleFactor,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'awj2mirs' /* Already have an account?  */,
                                    ),
                                    style: TextStyle(),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      '9phh61h9' /* Sign In */,
                                    ),
                                    style: TextStyle(
                                      color: CustomTheme.of(context).primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                                style: CustomTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          CustomTheme.of(context).primaryText,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.firstNameController,
                          focusNode: _model.firstNameFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).secondaryText,
                                  fontSize: 16.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'lfk9erhj' /* First Name */,
                            ),
                            hintStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            filled: true,
                            fillColor:
                                CustomTheme.of(context).secondaryBackground,
                          ),
                          style: CustomTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: CustomTheme.of(context).primaryText,
                                fontSize: 16.0,
                              ),
                          keyboardType: TextInputType.name,
                          validator: _model.firstNameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.lastNameController,
                          focusNode: _model.lastNameFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).secondaryText,
                                  fontSize: 16.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              '3n81jome' /* Last Name */,
                            ),
                            hintStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            filled: true,
                            fillColor:
                                CustomTheme.of(context).secondaryBackground,
                          ),
                          style: CustomTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: CustomTheme.of(context).primaryText,
                                fontSize: 16.0,
                              ),
                          keyboardType: TextInputType.name,
                          validator: _model.lastNameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.emailController1,
                          focusNode: _model.emailFocusNode1,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).secondaryText,
                                  fontSize: 16.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              '27jv28es' /* Email address */,
                            ),
                            hintStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            filled: true,
                            fillColor:
                                CustomTheme.of(context).secondaryBackground,
                          ),
                          style: CustomTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: CustomTheme.of(context).primaryText,
                                fontSize: 16.0,
                              ),
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.emailController1Validator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.passwordController,
                          focusNode: _model.passwordFocusNode,
                          autofocus: true,
                          obscureText: !_model.passwordVisibility,
                          decoration: InputDecoration(
                            labelStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).secondaryText,
                                  fontSize: 16.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'sf1rtyuw' /* Password */,
                            ),
                            hintStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            filled: true,
                            fillColor:
                                CustomTheme.of(context).secondaryBackground,
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.passwordVisibility =
                                    !_model.passwordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: CustomTheme.of(context).secondary,
                                size: 24.0,
                              ),
                            ),
                          ),
                          style: CustomTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: CustomTheme.of(context).primaryText,
                                fontSize: 16.0,
                              ),
                          validator: _model.passwordControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.emailController2,
                          focusNode: _model.emailFocusNode2,
                          autofocus: true,
                          obscureText: !_model.emailVisibility,
                          decoration: InputDecoration(
                            labelStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).secondaryText,
                                  fontSize: 16.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              '2gqdhnxk' /* Confirm Password */,
                            ),
                            hintStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            filled: true,
                            fillColor:
                                CustomTheme.of(context).secondaryBackground,
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => _model.emailVisibility =
                                    !_model.emailVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.emailVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: CustomTheme.of(context).secondary,
                                size: 24.0,
                              ),
                            ),
                          ),
                          style: CustomTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: CustomTheme.of(context).primaryText,
                                fontSize: 16.0,
                              ),
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.emailController2Validator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.phoneNumberController1,
                          focusNode: _model.phoneNumberFocusNode1,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).secondaryText,
                                  fontSize: 16.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              '52crqc82' /* Phone Number */,
                            ),
                            hintStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            filled: true,
                            fillColor:
                                CustomTheme.of(context).secondaryBackground,
                          ),
                          style: CustomTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: CustomTheme.of(context).primaryText,
                                fontSize: 16.0,
                              ),
                          keyboardType: TextInputType.phone,
                          validator: _model.phoneNumberController1Validator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: TextFormField(
                          controller: _model.phoneNumberController2,
                          focusNode: _model.phoneNumberFocusNode2,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).secondaryText,
                                  fontSize: 16.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'dxwjyuaw' /* Address */,
                            ),
                            hintStyle: CustomTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: CustomTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            filled: true,
                            fillColor:
                                CustomTheme.of(context).secondaryBackground,
                          ),
                          style: CustomTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: CustomTheme.of(context).primaryText,
                                fontSize: 16.0,
                              ),
                          keyboardType: TextInputType.streetAddress,
                          validator: _model.phoneNumberController2Validator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                unselectedWidgetColor:
                                    CustomTheme.of(context).secondaryText,
                              ),
                              child: Checkbox(
                                value: _model.checkboxValue ??= false,
                                onChanged: (newValue) async {
                                  setState(
                                      () => _model.checkboxValue = newValue!);
                                },
                                activeColor: CustomTheme.of(context).primary,
                                checkColor: CustomTheme.of(context).info,
                              ),
                            ),
                            Expanded(
                              child: RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'acma1im5' /* By clicking  */,
                                      ),
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'uslxhlo4' /* Continue,  */,
                                      ),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'lbi91oho' /* You'll be agreeing to our  */,
                                      ),
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '95bs2f4c' /* Terms  */,
                                      ),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'ws7dpphs' /* and  */,
                                      ),
                                      style: TextStyle(),
                                    ),
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '4plwuv6e' /* Conditions */,
                                      ),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            '5qqveg43' /* Continue */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 45.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: CustomTheme.of(context).primary,
                            textStyle:
                                CustomTheme.of(context).titleSmall.override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                    ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
