import '/flutter_flow/flutter_flow_util.dart';
import 'settingsand_preferences_widget.dart' show SettingsandPreferencesWidget;
import 'package:flutter/material.dart';

class SettingsandPreferencesModel
    extends FlutterFlowModel<SettingsandPreferencesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
