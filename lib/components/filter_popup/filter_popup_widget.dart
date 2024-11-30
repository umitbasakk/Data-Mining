import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/AIData.dart';
import 'package:food_delivery_prototype_app_ui_kit/utils/utils.dart';
import 'package:food_delivery_prototype_app_ui_kit/view_model/ai_view_model.dart';
import 'package:food_delivery_prototype_app_ui_kit/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'filter_popup_model.dart';
export 'filter_popup_model.dart';

class FilterPopupWidget extends StatefulWidget {
  FilterPopupWidget({super.key,required this.tag});
  String tag;

  @override
  State<FilterPopupWidget> createState() => _FilterPopupWidgetState();
}

class _FilterPopupWidgetState extends State<FilterPopupWidget> {
  late FilterPopupModel _model;
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  int? selectedIndex = -1;
  AIData requestData = AIData();
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterPopupModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    
    _model.tagController ??= TextEditingController();
    _model.tagFieldFocusNode ??= FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
      /*
      if(widget.aiData?.startedDate?.toString() != null && widget.aiData?.endDate?.toString() != null){
        _range =  "${widget.aiData.startedDate} - ${widget.aiData.endDate}";
         _model.textController.text = _range;
      }
      _model.sliderValue = double.parse(widget.aiData.quantityLimit.toString());
      selectedIndex = int.parse(widget.aiData.category!);
      */
    }));
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
                  _model.textController.text = _range;

      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }

      
    });
  }

  DateTime stringToDatetime(String string){
    List<String> timeArr = string.split("/");
    return DateTime(int.parse(timeArr[2]),int.parse(timeArr[1]),int.parse(timeArr[0]));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        final aiViewModel = Provider.of<AIViewModel>(context);
        final userViewModel = Provider.of<UserViewModel>(context); 
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 300.0,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            autofocus: true,
                            
                            onTap: () =>{
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SfDateRangePicker(
                                      showActionButtons: true,
                                      onSelectionChanged: _onSelectionChanged,
                                      selectionMode: DateRangePickerSelectionMode.range,
                                      initialSelectedRange: _range != ''? PickerDateRange(stringToDatetime(_range.split(" - ")[0]),stringToDatetime(_range.split(" - ")[1])): null,
                                      onSubmit: (Object? value) {
                                        Navigator.pop(context);
                                      },
                                      onCancel: () {
                                      Navigator.pop(context);
                                      },
                                    );
                                    },
                                  ).then((value) {
                                   
                                  })
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: "Tarih Giriniz.",
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                             
                              
                              enabledBorder:OutlineInputBorder(
                                borderSide: BorderSide(color:  FlutterFlowTheme.of(context).grey, width: 1.0),
                                borderRadius: BorderRadius.all(Radius.circular(16)) 
                              ), 
                              focusedBorder:OutlineInputBorder(
                                borderSide: BorderSide(color:  FlutterFlowTheme.of(context).black, width: 1.0),
                                borderRadius: BorderRadius.all(Radius.circular(16)) 
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              prefixIcon: Icon(
                                Icons.date_range,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),

                      //Hash tag

                     
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'ra08b12o' /* Categories */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(5, (index){
                           return 
                              Padding(
                              padding: index == 0 ? const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0) :const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                              child: FFButtonWidget(
                            onPressed: () {                             
                              setState((){
                              if (selectedIndex == index){
                                selectedIndex = -1;
                              }else{
                                selectedIndex = index;

                              }
                              });
                            },
                            text: FFLocalizations.of(context).getText(
                              '9f5qk755' /* Hamburgers */,
                            ),
                            
                            icon: FaIcon(
                              FontAwesomeIcons.hamburger,
                              color: FlutterFlowTheme.of(context).warning,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: selectedIndex == index ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    color: selectedIndex ==  index ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryText,
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              
                              borderSide: BorderSide(
                                color: selectedIndex != index ? FlutterFlowTheme.of(context).grey : FlutterFlowTheme.of(context).primaryBackground,
                                width: 1.0,
                              ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          )
                           ); 
                        }
                        )  
                      ),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: Text("Adet",
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0,0.0, 0.0),
                      child: Slider(
                        activeColor: FlutterFlowTheme.of(context).primary,
                        inactiveColor: FlutterFlowTheme.of(context).alternate,
                        min: 0,
                        max: 100,
                        value: _model.sliderValue ??= 100.0,
                        onChanged: (newValue) {
                          newValue = double.parse(newValue.toStringAsFixed(0));
                          safeSetState(() => _model.sliderValue = newValue);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0,0.0, 0.0),
                      child: Center(
                        child: Flexible(
                            child: Text( _model.sliderValue!.toInt().toString(),
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                    ),
                  ].divide(const SizedBox(height: 16.0)),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                              try{
                                 final parsedDate = DateFormat("dd/MM/yyyy - dd/MM/yyyy").parseStrict(_range); 
                              }catch(e){
                                  Utils.flushBarErrorMessage("Date format is incorrect", context);
                                  return;
                              }
                              if(selectedIndex.toString() == "-1"){
                                  Utils.flushBarErrorMessage("You have to choose a category", context);
                              }else{
                              final startedDate = _range.split(" - ")[0].split(" ")[0];
                              final endDate = _range.split(" - ")[1].split(" ")[0];

                              requestData.startedDate = startedDate.toString();
                              requestData.endDate = endDate.toString();
                              requestData.hashTag = widget.tag;
                              requestData.category = selectedIndex!.toString();
                              requestData.quantityLimit = _model.sliderValue!.toString();
                              //aiViewModel.requestApi(requestData.toJson(), context, userViewModel.user?.token ?? "");
                              Navigator.pop(context);
                              }
                          },
                          text: FFLocalizations.of(context).getText(
                            'hnv04kes' /* Apply Filter */,
                          ),
                          options: FFButtonOptions(
                            height: 56.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 16.0, 24.0, 16.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                              Navigator.pop(context);       
                          },
                          text: "Cancel",
                          options: FFButtonOptions(
                            height: 56.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 16.0, 24.0, 16.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).grey3,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color.fromARGB(255, 24, 20, 20),
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(const SizedBox(height: 24.0)),
            ),
          ),
        ),
      ],
    );
  }
}
