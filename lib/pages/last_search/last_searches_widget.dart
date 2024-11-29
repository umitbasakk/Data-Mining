import 'package:food_delivery_prototype_app_ui_kit/model/AiDataResponse.dart';
import 'package:food_delivery_prototype_app_ui_kit/view_model/ai_view_model.dart';
import 'package:food_delivery_prototype_app_ui_kit/view_model/auth_view_model.dart';
import 'package:food_delivery_prototype_app_ui_kit/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '/components/button_order_status/button_order_status_widget.dart';
import '../../components/last_search_item/last_search_item_widget.dart';
import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'last_search_model.dart';
export 'last_search_model.dart';

class LastSearchesWidget extends StatefulWidget {
  const LastSearchesWidget({super.key});

  @override
  State<LastSearchesWidget> createState() => _MyOrderWidgetState();
}

class _MyOrderWidgetState extends State<LastSearchesWidget> with TickerProviderStateMixin {
  late MyOrderModel _model;
  late List<AiDataResponse> aiDataList = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyOrderModel());
   
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    final aiViewProvider = Provider.of<AIViewModel>(context);
    final userViewProvider = Provider.of<UserViewModel>(context);
    return FutureBuilder(
      future: aiViewProvider.getAllRequestOfUserApi(context,userViewProvider.user?.token ?? ""), 
      builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
              
                       return GestureDetector(
                                      onTap: () {
                                        // Kullanıcı ekrana dokunduğunda bir işlem yapılabilir.
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
            }else if(snapshot.hasError){
             return  Center(child: Text("error"),);
            }else if(snapshot.hasData){
              final data = snapshot.data!;

              return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).grey3,
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).grey3,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Recent Searches",
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).grey3,
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: List.generate(data.length, (index){
                                                          return Padding(
                                                            padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                                                            child: wrapWithModel(
                                                              model:
                                                                  _model.myOrderItemModel1,
                                                              
                                                              child:  LastSearchItemWidget(aiData: data[index],),
                                                            ),
                                                            ); 
                                                          }),
                                                        ),
                                                      ),
                                        ),
                                      ),
                                     
                                    ].divide(const SizedBox(height: 16.0)),
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                             
                            ]
                                .divide(const SizedBox(height: 24.0))
                                .addToStart(const SizedBox(height: 30.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  

                      }else{
                       return Center(child: Text("error"),);
              }
      }
    );
  }
}
