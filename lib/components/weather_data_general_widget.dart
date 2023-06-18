import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WeatherDataEntryGenWidget extends StatefulWidget {
  const WeatherDataEntryGenWidget({Key? key}) : super(key: key);

  @override
  _WeatherDataEntryGenWidgetState createState() => _WeatherDataEntryGenWidgetState();
}

class _WeatherDataEntryGenWidgetState extends State<WeatherDataEntryGenWidget> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
      child: ValueListenableBuilder<Box<dynamic>>(
        valueListenable: Hive.box('settings').listenable(),
        builder: (context, box, widget) {
          _textEditingController.text = box.get('city', defaultValue: '');

          return TextFormField(
            controller: _textEditingController,
            textCapitalization: TextCapitalization.words,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Zip Code',
              labelStyle: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                color: Color(0xFF57636C),
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
              hintText: 'Zip Code',
              hintStyle: TextStyle(
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
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              color: Color(0xFF14181B),
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
            onChanged: (val) {
              box.put('city', val);
            },
          );
        },
      ),
    );
  }
}
