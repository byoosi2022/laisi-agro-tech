import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '/custom_widgets/theme.dart';
import '/custom_widgets/util.dart';
import '/custom_widgets/widgets.dart';
import 'login_with_phone_verification_model.dart';

export 'login_with_phone_verification_model.dart';

class LoginWithPhoneVerificationWidget extends StatefulWidget {
  const LoginWithPhoneVerificationWidget({Key? key}) : super(key: key);

  @override
  _LoginWithPhoneVerificationWidgetState createState() =>
      _LoginWithPhoneVerificationWidgetState();
}

class _LoginWithPhoneVerificationWidgetState
    extends State<LoginWithPhoneVerificationWidget> {
  late LoginWithPhoneVerificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginWithPhoneVerificationModel());
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
              Align(
                alignment: AlignmentDirectional(0.62, -0.87),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/laisi-logo.png',
                    width: 150.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '21m65n9n' /* Sign In */,
                              ),
                              style:
                                  CustomTheme.of(context).titleLarge.override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'm0g09xnl' /* Enter verification code */,
                                ),
                                style:
                                    CustomTheme.of(context).titleLarge.override(
                                          fontFamily: 'Inter',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: PinCodeTextField(
                            autoDisposeControllers: false,
                            appContext: context,
                            length: 6,
                            textStyle: CustomTheme.of(context).bodyLarge,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            enableActiveFill: true,
                            autoFocus: true,
                            enablePinAutofill: false,
                            errorTextSpace: 16.0,
                            showCursor: true,
                            cursorColor: CustomTheme.of(context).primary,
                            obscureText: false,
                            hintCharacter: '●',
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme(
                              fieldHeight: 44.0,
                              fieldWidth: 44.0,
                              borderWidth: 2.0,
                              borderRadius: BorderRadius.circular(12.0),
                              shape: PinCodeFieldShape.box,
                              activeColor: CustomTheme.of(context).primaryText,
                              inactiveColor: CustomTheme.of(context).alternate,
                              selectedColor: CustomTheme.of(context).primary,
                              activeFillColor:
                                  CustomTheme.of(context).primaryText,
                              inactiveFillColor:
                                  CustomTheme.of(context).alternate,
                              selectedFillColor:
                                  CustomTheme.of(context).primary,
                            ),
                            controller: _model.pinCodeController,
                            onChanged: (_) {},
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: _model.pinCodeControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('loginWithPhoneVerification');
                            },
                            text: FFLocalizations.of(context).getText(
                              'btshf8af' /* Continue */,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
