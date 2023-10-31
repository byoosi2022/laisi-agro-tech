import '/custom_widgets/icon_button.dart';
import '/custom_widgets/theme.dart';
import '/custom_widgets/util.dart';
import '/custom_widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();
    _model.passwordController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
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
          systemStatusBarContrastEnforced: false,
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
          top: false,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-1.00, 1.00),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SvgPicture.asset(
                    'assets/images/fi-sr-feather.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.01, 0.87),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SvgPicture.asset(
                    'assets/images/Ellipse_13.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.00, 1.00),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SvgPicture.asset(
                    'assets/images/Ellipse_12.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.46, -0.76),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SvgPicture.asset(
                    'assets/images/Ellipse_11.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, -1.00),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SvgPicture.asset(
                    'assets/images/Ellipse_10.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.62, -0.87),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/laisi-logo.png',
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
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
                                'aeq7ywsj' /* Sign In */,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: TextFormField(
                            controller: _model.emailController,
                            focusNode: _model.emailFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: CustomTheme.of(context).labelMedium,
                              hintText: FFLocalizations.of(context).getText(
                                'cixxn467' /* Email or Username */,
                              ),
                              hintStyle: CustomTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomTheme.of(context).primary,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              filled: true,
                              fillColor:
                                  CustomTheme.of(context).secondaryBackground,
                            ),
                            style: CustomTheme.of(context).bodyMedium,
                            keyboardType: TextInputType.emailAddress,
                            validator: _model.emailControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: TextFormField(
                            controller: _model.passwordController,
                            focusNode: _model.passwordFocusNode,
                            obscureText: !_model.passwordVisibility,
                            decoration: InputDecoration(
                              labelStyle: CustomTheme.of(context).labelMedium,
                              hintText: FFLocalizations.of(context).getText(
                                'qn5zdwsd' /* Password */,
                              ),
                              hintStyle: CustomTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomTheme.of(context).primary,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomTheme.of(context).error,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(6),
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
                                  size: 24,
                                ),
                              ),
                            ),
                            style: CustomTheme.of(context).bodyMedium,
                            validator: _model.passwordControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'uo9smbvb' /* Sign In */,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 45,
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              iconPadding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: CustomTheme.of(context).primary,
                              textStyle:
                                  CustomTheme.of(context).titleSmall.override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                      ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '49izen31' /* Or  */,
                                  ),
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'epa8m5na' /* Sign In  */,
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '8uhgcv5q' /* With */,
                                  ),
                                  style: TextStyle(),
                                )
                              ],
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: CustomTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 12,
                                      borderWidth: 1,
                                      buttonSize: 65,
                                      fillColor: CustomTheme.of(context)
                                          .secondaryBackground,
                                      icon: FaIcon(
                                        FontAwesomeIcons.google,
                                        color:
                                            CustomTheme.of(context).primaryText,
                                        size: 35,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: CustomTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 12,
                                      borderWidth: 1,
                                      buttonSize: 65,
                                      fillColor: CustomTheme.of(context)
                                          .secondaryBackground,
                                      icon: Icon(
                                        Icons.apple,
                                        color:
                                            CustomTheme.of(context).primaryText,
                                        size: 35,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: CustomTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 12,
                                      borderWidth: 1,
                                      buttonSize: 65,
                                      fillColor: CustomTheme.of(context)
                                          .secondaryBackground,
                                      icon: Icon(
                                        Icons.phone_locked,
                                        color:
                                            CustomTheme.of(context).primaryText,
                                        size: 35,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('loginWithPhone');
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'jcrw0664' /* Do not have an account?  */,
                                  ),
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'pdwrbpd5' /* Sign Up */,
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      context.pushNamed('signup');
                                    },
                                )
                              ],
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ),
                        ],
                      ),
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
