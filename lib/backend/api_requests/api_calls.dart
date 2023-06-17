import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Weather Data Group Code

class WeatherDataGroup {
  static String baseUrl = 'https://api.weatherapi.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static ForecastRetrieveCall forecastRetrieveCall = ForecastRetrieveCall();
}

class ForecastRetrieveCall {
  Future<ApiCallResponse> call({
    int? newVariable,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'forecast retrieve',
      apiUrl: '${WeatherDataGroup.baseUrl}/forecast.json',
      callType: ApiCallType.GET,
      headers: {
        ...WeatherDataGroup.headers,
      },
      params: {
        'rwdy': newVariable,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Weather Data Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
