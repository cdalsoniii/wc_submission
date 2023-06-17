import '/components/weather_data_entry_widget.dart';
import '/components/weather_stats_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WeatherModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? zipCode;

  ///  State fields for stateful widgets in this page.

  // Model for weatherDataEntry component.
  late WeatherDataEntryModel weatherDataEntryModel;
  // Model for weatherStatsComponent component.
  late WeatherStatsComponentModel weatherStatsComponentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    weatherDataEntryModel = createModel(context, () => WeatherDataEntryModel());
    weatherStatsComponentModel =
        createModel(context, () => WeatherStatsComponentModel());
  }

  void dispose() {
    weatherDataEntryModel.dispose();
    weatherStatsComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
