import '/components/weather_stats_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class WeatherStatsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for weatherStatsComponent component.
  late WeatherStatsComponentModel weatherStatsComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    weatherStatsComponentModel =
        createModel(context, () => WeatherStatsComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    weatherStatsComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
