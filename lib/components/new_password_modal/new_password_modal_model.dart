import '/flutter_flow/flutter_flow_util.dart';
import 'new_password_modal_widget.dart' show NewPasswordModalWidget;
import 'package:flutter/material.dart';

class NewPasswordModalModel extends FlutterFlowModel<NewPasswordModalWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for UserNameTextField widget.
  FocusNode? currentPasswordTextFieldFocusNode;
  TextEditingController? currentPasswordTextFieldTextController;
  late bool currentPasswordTextFieldVisibility;

  // State field(s) for UserNameTextField widget.
  FocusNode? newPasswordTextFieldFocusNode;
  TextEditingController? newPasswordTextFieldTextController;
  late bool newPasswordTextFieldVisibility;


  @override
  void initState(BuildContext context) {
    currentPasswordTextFieldVisibility = false;
    newPasswordTextFieldVisibility = false;
    
  }

  @override
  void dispose() {
    currentPasswordTextFieldFocusNode?.dispose();
    currentPasswordTextFieldTextController?.dispose();

    newPasswordTextFieldFocusNode?.dispose();
    newPasswordTextFieldTextController?.dispose();
  }
}
