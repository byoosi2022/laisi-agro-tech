import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/custom_widgets/animations.dart';
import '/custom_widgets/instant_timer.dart';
import '/custom_widgets/theme.dart';
import '/custom_widgets/util.dart';
import 'splash_model.dart';

export 'splash_model.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  late SplashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'imageOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-47.0, 69.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(49.0, 49.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 450.ms,
          begin: Offset(49.0, 53.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-49.0, -44.99999999999999),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 450.ms,
          begin: Offset(-49.0, -53.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'imageOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 350.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1600),
        callback: (timer) async {
          if (Navigator.of(context).canPop()) {
            context.pop();
          }
          context.pushNamed('login');

          _model.instantTimer?.cancel();
        },
        startImmediately: false,
      );
    });
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
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation1']!),
              ),
              Align(
                alignment: AlignmentDirectional(0.01, 0.87),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/Ellipse_13.svg',
                    fit: BoxFit.cover,
                  ),
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation2']!),
              ),
              Align(
                alignment: AlignmentDirectional(1.00, 1.00),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/Ellipse_12.svg',
                    fit: BoxFit.cover,
                  ),
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation3']!),
              ),
              Align(
                alignment: AlignmentDirectional(-0.46, -0.76),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/Ellipse_11.svg',
                    fit: BoxFit.cover,
                  ),
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation4']!),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, -1.00),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    'assets/images/Ellipse_10.svg',
                    fit: BoxFit.cover,
                  ),
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation5']!),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, -0.14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/laisi-logo.png',
                    width: 200.0,
                    fit: BoxFit.contain,
                  ),
                ).animateOnPageLoad(
                    animationsMap['imageOnPageLoadAnimation6']!),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 0.89),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'tdvgejkx' /* V 1.0.0 */,
                  ),
                  style: CustomTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: CustomTheme.of(context).secondaryBackground,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
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
