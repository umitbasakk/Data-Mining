import 'dart:io';

import 'package:food_delivery_prototype_app_ui_kit/components/log_out_modal/log_out_modal_widget.dart';
import 'package:food_delivery_prototype_app_ui_kit/flutter_flow/flutter_flow_widgets.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/AIData.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/user.dart';
import 'package:food_delivery_prototype_app_ui_kit/utils/utils.dart';
import 'package:food_delivery_prototype_app_ui_kit/view_model/ai_view_model.dart';
import 'package:food_delivery_prototype_app_ui_kit/view_model/user_view_model.dart';
import 'package:image_picker/image_picker.dart';
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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  File? _selectedImage;
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
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
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                padding: EdgeInsets.only(top: 0),
                                                child:  SizedBox(
                                                  width: 250.0,
                                                  child: TextButton(
                                                      onPressed: () async{
                                                       _pickImageFromGallery();
                                                      },
                                                      child: Text("Select Image On Gallery"),
                                                    ),
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
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
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                padding: EdgeInsets.only(top: 0),
                                                child:  SizedBox(
                                                  width: 250.0,
                                                  child: TextButton(
                                                      onPressed: () async{
                                                       _pickImageFromGallery();
                                                      },
                                                      child: Text("Take a Picture"),
                                                    ),
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
            _selectedImage != null ? Text("Selected Image",style: TextStyle(color:Colors.white),) : const Text("Please Select an image",style: TextStyle(color:Colors.white),),
        ],
      ),
    ),
      Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
       
      ),
      child:  SingleChildScrollView(
        child: Column(
          children: [
              _selectedImage != null ? Image.file(_selectedImage!,width: 350,height: 350,) : const Text(""),
          ],
        )
      ),
      ),
      ],
    );
  }

  Future _pickImageFromGallery() async{
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage= File(returnedImage!.path);
    });
  }
}
