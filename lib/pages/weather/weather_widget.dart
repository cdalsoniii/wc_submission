import '/components/weather_data_entry_widget.dart';
import '/components/weather_stats_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'weather_model.dart';
export 'weather_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import request library
import 'package:http/http.dart' as http;

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late WeatherModel _model;
  int? zipCode;
  int? opinion;
  double? todaysHigh;
  double? todaysLow;
  int? todaysChanceOfRainfall;
  String? todaysCondition;
  int? uv;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeatherModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,

      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ),
            TextField(
              //controller: zipCodeController,
              textCapitalization: TextCapitalization.words,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Zip Code',
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF57636C),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                hintText: 'Zip Code',
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF57636C),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
              ),
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: Color(0xFF15212B),
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
              textAlign: TextAlign.start,
              maxLines: 1,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                //setState(() => _model.zipCode = value);
                print("value: $value");

                // Set the state of a zip code
                //zipCode = int.parse(value);
                setState(() {
                  zipCode = int.parse(value);
                });

                print("zip code: " + this.zipCode.toString());

              },
            ),
            TextField(
              //controller: zipCodeController,
              textCapitalization: TextCapitalization.words,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Your Opinion',
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF57636C),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                hintText: 'Your Opinion in F',
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Color(0xFF57636C),
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFDBE2E7),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
              ),
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: Color(0xFF15212B),
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
              textAlign: TextAlign.start,
              maxLines: 1,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                //setState(() => _model.zipCode = value);
                // cast value as int
                setState(() {
                  opinion = int.parse(value);
                });


              },
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.05),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {

                    try {

                       // Create a get request from a url
                    final response = await http.post(
                      //Uri.parse('http://localhost:3000/api/weather_processing'), // dev
                      Uri.parse('https://v-server-cdalsoniii.vercel.app/api/weather_processing'), // prod
                      body: jsonEncode(<String, dynamic>{
                        'zipCode': this.zipCode,
                        'opinion': this.opinion,
                      }),

                      );

                      print("response: " + this.zipCode.toString());
                      print("opinion: " + this.opinion.toString());

                    } catch (e) {
                      print("error: $e");
                    }
                   
                    /*
                    // Parse the response body
                    final parsed = jsonDecode(response.body);
                    print(parsed);
                    // Set the state of todaysHigh
                    setState(() {
                      // set today's high to parsed["day"]["maxtemp_f"]
                      todaysHigh = parsed["forecastday"][0]['day']["maxtemp_f"];
                      todaysLow = parsed["forecastday"][0]['day']["mintemp_f"];
                      todaysChanceOfRainfall = parsed["forecastday"][0]['day']["daily_chance_of_rain"];
                      todaysCondition = parsed["forecastday"][0]['day']["condition"]["text"];
                      uv = parsed["forecastday"][0]['day']['uv'];
                      opinion = opinion;
                      print("todaysHigh: $todaysHigh");
                      print("todaysLow: $todaysLow");
                      print("todaysChanceOfRainfall: $todaysChanceOfRainfall");
                      print("todaysCondition: $todaysCondition");
                      print("uv: $uv");

                  });
                  */

                  },
                  text: 'Get Forecast',
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF4B39EF),
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                            ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            Flexible(
              child: 
                 WeatherStatComponentWidget(
                  key: Key('weatherStats'),
                  todaysHigh: this.todaysHigh ?? 0,
                  todaysLow: this.todaysLow ?? 0,
                  todaysChanceRainfall: this.todaysChanceOfRainfall ?? 0,
                  todaysCondition: this.todaysCondition ?? '',
                  uv: this.uv ?? 0,
                  opinion: this.opinion ?? 0,
                  ),
              ),
          ],
        ),
      ),
    );
  }
}



class WeatherDataEntryWidget extends StatefulWidget {
  const WeatherDataEntryWidget({Key? key}) : super(key: key);

  @override
  _WeatherDataEntryWidgetState createState() => _WeatherDataEntryWidgetState();
}

class _WeatherDataEntryWidgetState extends State<WeatherDataEntryWidget> {
  late WeatherDataEntryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeatherDataEntryModel());

    _model.cityController ??= TextEditingController();
  }

  @override
  void dispose() {
    //_model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
      child: TextFormField(
        controller: _model.cityController,
        textCapitalization: TextCapitalization.words,
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Zip Code',
          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Plus Jakarta Sans',
                color: Color(0xFF57636C),
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
          hintText: 'Zip Code',
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Plus Jakarta Sans',
                color: Color(0xFF57636C),
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFE0E3E7),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF4B39EF),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFFF5963),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFFF5963),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Plus Jakarta Sans',
              color: Color(0xFF14181B),
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
        validator: _model.cityControllerValidator.asValidator(context),
      ),
    );
  }
}


class WeatherStatComponentWidget extends StatefulWidget {

  final double? todaysHigh; // Add todaysHigh parameter
  final double? todaysLow; // Add todaysLow parameter
  final int? todaysChanceRainfall; // Add todaysLow parameter
  final String? todaysCondition;
  final int? uv;
  final int? opinion;

  const WeatherStatComponentWidget({
    Key? key,
    this.todaysHigh,
    this.todaysLow,
    this.todaysChanceRainfall,
    this.todaysCondition,
    this.uv,
    this.opinion
    }) : super(key: key);

  @override
  _WeatherStatComponentWidgetState createState() =>
      _WeatherStatComponentWidgetState();
}

class _WeatherStatComponentWidgetState
    extends State<WeatherStatComponentWidget> with TickerProviderStateMixin {

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //_model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weather Stats',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  color: Color(0xFF101213),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 160.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F8),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.supervisor_account_rounded,
                            color: Color(0xFF101213),
                            size: 44.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 4.0),
                            child: Text(
                              this.widget.todaysHigh.toString() ?? '',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF101213),
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Text(
                            'Today\'s High in F',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF57636C),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 160.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F8),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.supervisor_account_rounded,
                            color: Color(0xFF101213),
                            size: 44.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 4.0),
                            child: Text(
                              this.widget.todaysLow.toString() ?? '',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF101213),
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Text(
                            'Today\'s Low in F',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF57636C),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 160.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F8),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.supervisor_account_rounded,
                            color: Color(0xFF101213),
                            size: 44.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 4.0),
                            child: Text(
                              this.widget.todaysChanceRainfall.toString() ??
                                  '',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF101213),
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Text(
                            '% Chance of Rainfall',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF57636C),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 160.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F8),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.supervisor_account_rounded,
                            color: Color(0xFF101213),
                            size: 44.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 4.0),
                            child: Text(
                              this.widget.todaysCondition.toString() ?? '',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF101213),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Text(
                            'Weather Conditions',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF57636C),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 160.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F8),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.supervisor_account_rounded,
                            color: Color(0xFF101213),
                            size: 44.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 4.0),
                            child: Text(
                              this.widget.uv.toString() ??
                                  '',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF101213),
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Text(
                            'UV',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF57636C),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                     Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 160.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F4F8),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.supervisor_account_rounded,
                            color: Color(0xFF101213),
                            size: 44.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 4.0),
                            child: Text(
                              this.widget.opinion.toString() ??
                                  '',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF101213),
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Text(
                            'Your Last Guess in Farenheit',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF57636C),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
