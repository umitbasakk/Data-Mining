import '/components/confirm_modal/confirm_modal_widget.dart';
import '/components/log_out_modal/log_out_modal_widget.dart';
import '/components/new_password_modal/new_password_modal_widget.dart';
import '/components/register_success_modal/register_success_modal_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_html/flutter_html.dart';
import 'navigator_model.dart';
export 'navigator_model.dart';

class NavigatorWidget extends StatefulWidget {
  const NavigatorWidget({
    super.key,
    bool? expanded,
  }) : expanded = expanded ?? false;

  final bool expanded;

  @override
  State<NavigatorWidget> createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget>
    with TickerProviderStateMixin {
  late NavigatorModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigatorModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.expanded = widget.expanded;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(400.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 900.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 200.0.ms,
            duration: 900.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              alignment: const AlignmentDirectional(1.0, -1.0),
              children: [
                if (_model.expanded)
                  Align(
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: Container(
                      width: 375.0,
                      height: 440.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 25.0,
                            color: Color(0x18000000),
                            offset: Offset(
                              0.0,
                              8.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(-1.0, 0),
                            child: TabBar(
                              isScrollable: true,
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'w4ui9cw8' /* Pages */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'oj3cf9cd' /* Modals */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '1z4hfai6' /* About Template */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '86o94vt0' /* Builderking */,
                                  ),
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [
                                  () async {},
                                  () async {},
                                  () async {},
                                  () async {}
                                ][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                KeepAliveWidgetWrapper(
                                  builder: (context) => ListView(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('Onboarding');
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.file_copy_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 16.0,
                                              ),
                                              title: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'tl1qab9r' /* Onboarding */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 22.0,
                                              ),
                                              dense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('Setting');
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.file_copy_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 16.0,
                                              ),
                                              title: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '6vbi0byh' /* Setting */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 22.0,
                                              ),
                                              dense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('Verification');
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.file_copy_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 16.0,
                                              ),
                                              title: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '3wz6lqp1' /* Verification */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 22.0,
                                              ),
                                              dense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => ListView(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: const SizedBox(
                                                    height: double.infinity,
                                                    child: ConfirmModalWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.diamond_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 16.0,
                                              ),
                                              title: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '5o9cd5e2' /* Confirm */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 22.0,
                                              ),
                                              dense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: const SizedBox(
                                                    height: double.infinity,
                                                    child: LogOutModalWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.diamond_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 16.0,
                                              ),
                                              title: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'c2evnsw5' /* Logout */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 22.0,
                                              ),
                                              dense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: const SizedBox(
                                                    height: double.infinity,
                                                    child:
                                                        NewPasswordModalWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.diamond_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 16.0,
                                              ),
                                              title: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '8l5zbjdz' /* New Password */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 22.0,
                                              ),
                                              dense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: const SizedBox(
                                                    height: double.infinity,
                                                    child:
                                                        RegisterSuccessModalWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            child: ListTile(
                                              leading: Icon(
                                                Icons.diamond_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 16.0,
                                              ),
                                              title: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kwl7igml' /* Register Success */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              trailing: Icon(
                                                Icons.keyboard_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 22.0,
                                              ),
                                              dense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: const BoxDecoration(),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Html(
                                            data:
                                                '<!DOCTYPE html>\n<html>\n<head>\n  <title>FoodCort Food Delivery App UI Kit</title>\n</head>\n<body>\n  <h2>FoodCort Food Delivery App UI Kit</h2>\n  <h3>Description:</h3>\n  <p>\n    FoodCort is a Flutterflow UI Kit designed specifically for Food Delivery Apps. It comes with 25+ screens and 10+ components, all following the best UI/UX practices. This kit is well-prepared and ready for you to integrate your own logic. Easily customizable with theme widgets, FoodCort supports multi-language options and is highly scalable. This UI Kit is designed to make your development process easier and faster for your next project.\n  </p>\n  <h3>Features:</h3>\n  <ul>\n    <li><strong>25+ Premium Screens:</strong> Each screen is meticulously designed to provide an optimal user experience.</li>\n    <li><strong>10+ Premium Components:</strong> Utilize top-of-the-line components to build a feature-rich application.</li>\n    <li><strong>Customizable Theme Widgets:</strong> Modify colors and theme widgets to align with your brand identity.</li>\n    <li><strong>Multi-Language Support:</strong> FoodCort is easily adaptable to different languages.</li>\n    <li><strong>Neatly Organized Pages and Widgets:</strong> Navigate through the UI effortlessly thanks to well-structured organization.</li>\n    <li><strong>Best UI/UX Practices:</strong> FoodCort incorporates best UI/UX practices, serving as both a tool and a learning resource.</li>\n\n  </ul>\n  <h3>How to Use:</h3>\n  <ul>\n    <li><strong>Integrate Your Backend:</strong> Easily connect FoodCort to your existing backend systems.</li>\n    <li><strong>Implement Logic Actions:</strong> Incorporate functionalities like authentication, account creation, and data collection seamlessly.</li>\n    <li><strong>Customize Your Theme:</strong> Modify colors and theme widgets to align with your brand identity.</li>\n  </ul>\n  <p>\n    FoodCort is the perfect toolkit to kickstart your project without grappling with UI/UX issues, and it\'s an excellent resource for learning the best UI/UX practices.\n  </p>\n  <p>\n    Unlock even more potential by joining the Builderking community, where you\'ll find additional resources and support to make the most of your FoodCort experience.\n  </p>\n</body>\n</html>\n',
                                            onLinkTap: (url, _, __) =>
                                                launchURL(url!),
                                          ),
                                        ].addToEnd(const SizedBox(height: 24.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                KeepAliveWidgetWrapper(
                                  builder: (context) => SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Html(
                                          data:
                                              '<!DOCTYPE html>\n<html>\n<head>\n  <title>About Builderking</title>\n</head>\n<body>\n\n  <h2>Builderking</h2>\n  <h4 style=\"font-style:italic;\">Build like a king</h4>\n\n  <p><strong>Website:</strong> <a href=\"https://builderking.io\" target=\"_blank\">builderking.io</a></p>\n  <p><strong>Support Email:</strong> <a href=\"mailto:support@builderking.io\">support@builderking.io</a></p>\n  \n  <h4>Follow Us:</h4>\n  <ul>\n    <li><a href=\"https://www.youtube.com/@builderkingio\" target=\"_blank\">Youtube</a></li>\n    <li><a href=\"https://x.com/builderking_io\" target=\"_blank\">Twitter (now x.com)</a></li>\n  </ul>\n\n  <h4>Who We Are:</h4>\n  <p>Builderking is your go-to resource in the no-code space. Specializing in Flutterflow and Weweb, we\'re dedicated to making your development journey a breeze. We provide educational content, best practices, and time-saving tips and tricks, all curated to help you build software like a king!</p>\n\n  <h4>What We Offer:</h4>\n  <ul>\n    <li><strong>Educational Excellence:</strong> Comprehensive resources to help you master Flutterflow and Weweb.</li>\n    <li><strong>Expert Templates:</strong> Our Flutterflow templates are professionally designed, feature-rich, and ready for a full build.</li>\n    <li><strong>Insider Tips:</strong> Find invaluable tips and tricks on our YouTube channel to optimize your building experience.</li>\n  </ul>\n\n  <h4>Our Goal:</h4>\n  <p>Empowering you to create software fit for a king!</p>\n\n</body>\n</html>\n',
                                          onLinkTap: (url, _, __) =>
                                              launchURL(url!),
                                        ),
                                      ].addToEnd(const SizedBox(height: 24.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
                if (!_model.hide)
                  Align(
                    alignment: const AlignmentDirectional(1.0, -1.0),
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Stack(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 38.0,
                              height: 38.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 20.0,
                                    color: Color(0x24000000),
                                    offset: Offset(
                                      0.0,
                                      4.0,
                                    ),
                                  )
                                ],
                                shape: BoxShape.circle,
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: ToggleIcon(
                                onPressed: () async {
                                  safeSetState(
                                      () => _model.expanded = !_model.expanded);
                                },
                                value: _model.expanded,
                                onIcon: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 22.0,
                                ),
                                offIcon: Icon(
                                  Icons.settings,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 22.0,
                                ),
                              ),
                            ),
                          ),
                          if (!widget.expanded)
                            Align(
                              alignment: const AlignmentDirectional(1.0, -1.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.hide = true;
                                  _model.expanded = false;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 17.0,
                                  height: 17.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ).animateOnPageLoad(
                        animationsMap['stackOnPageLoadAnimation']!),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
