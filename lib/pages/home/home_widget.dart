import 'package:food_delivery_prototype_app_ui_kit/components/log_out_modal/log_out_modal_widget.dart';
import 'package:food_delivery_prototype_app_ui_kit/flutter_flow/flutter_flow_widgets.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/AIData.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/user.dart';
import 'package:food_delivery_prototype_app_ui_kit/utils/utils.dart';
import 'package:food_delivery_prototype_app_ui_kit/view_model/ai_view_model.dart';
import 'package:food_delivery_prototype_app_ui_kit/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '/components/filter_popup/filter_popup_widget.dart';
import '/components/nav_bar_with_middle_button/nav_bar_with_middle_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;
  AIData aiData = AIData();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.tagController ??= TextEditingController();
    _model.tagFieldFocusNode ??= FocusNode();

  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {   
        final aiViewModel = Provider.of<AIViewModel>(context);
        final userViewModel = Provider.of<UserViewModel>(context); 
    return FutureBuilder(
      future: userViewModel.getUser(),
       builder: (context,snapshot){
        if (snapshot.hasData){
        return  Scaffold(
                  body: ListView(
                    children: <Widget>[
                      _top(userViewModel.user?.name??"Null"),
                    ],
                  ),
                );
        }else{
          return _LoadingScaffold();
        }
         
       }); 
  }

_LoadingScaffold(){
    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus(); // Klavyeyi gizlemek için
                                      },
                                      child: Scaffold(
                                        backgroundColor: Colors.white,
                                        body: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              // Dönen yüklenme animasyonu
                                              CircularProgressIndicator(
                                                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                                strokeWidth: 4.0,
                                              ),
                                              SizedBox(height: 20), // Animasyon ile yazı arasında boşluk
                                              // Yükleniyor yazısı
                                              Text(
                                                'Loading...',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
}


  _top(String Username){
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF192324),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
        )
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/Profile.png"),
                ),
                SizedBox(width: 10),
                Text("Welcome, " + Username, style: TextStyle(
                  color: Colors.white
                ),
                ),
                ],
              ),
              GestureDetector(
                onTap: () async{
                    await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor:
                              Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () =>
                                  FocusScope.of(context)
                                      .unfocus(),
                              child: Padding(
                                padding: MediaQuery
                                    .viewInsetsOf(
                                        context),
                                child:
                                    const LogOutModalWidget(),
                              ),
                            );
                          },
                        ).then((value) =>
                            safeSetState(() {}));
                },
                child:Icon(
                  FFIcons.klogout,
                  color:Colors.white,
                  size: 24.0,
                ), 
              ) 
            ],
          ),
          SizedBox(height: 60,),
           Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 24.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 15.0,
                                                  color: Color(0x66000000),
                                                  offset: Offset(
                                                    0.0,
                                                    4.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                SizedBox(
                                                  width: 290.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.tagController,
                                                    focusNode: _model
                                                        .tagFieldFocusNode,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:"#Enter tag",
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      prefixIcon: Icon(
                                                        FFIcons.ksearch,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderRadius: 10.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    FFIcons.kfilter,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 22.0,
                                                  ),
                                                  onPressed: () async {
                                                    if(_model.tagController.text.isEmpty){
                                                        Utils.flushBarErrorMessage("Tag cannot be empty ", context);
                                                    }else if (_model.tagController.text.length < 4){
                                                      Utils.flushBarErrorMessage("Tag must be greater than 5 characters.", context);
                                                    }else{
                                                      await showModalBottomSheet(
                                                      
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                 FilterPopupWidget(tag: _model.tagController.text),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                    }
                                                  
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
          //searcch
        ],
      ),
    );
  }
}
