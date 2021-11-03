
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_remote_data_source.dart';

import 'exchange_rates_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ExchangeRatesRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = ExchangeRatesRemoteDataSourceImpl(mockHttpClient);
  });

  final Map<String, dynamic> tJsonMap = {
    "Cur_ID":1,
    "Date":"2021-11-03T00:00:00",
    "Cur_Abbreviation":"Test",
    "Cur_Scale":1,
    "Cur_Name":"TestName",
    "Cur_OfficialRate":2.0,
  };

  test(
    'should perform a GET request on URL with application/json header',
    () async {
      when(mockHttpClient.get(
          Uri.parse('https://www.nbrb.by/api/exrates/rates?periodicity=0'),
          headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response(tJsonMap.toString(), 200));
      dataSource.getAllCurrencies();
      verify(mockHttpClient.get(
        Uri.parse('https://www.nbrb.by/api/exrates/rates?periodicity=0'),
        headers: {
          'Content-Type': 'application/json'
        },
      ));
    },
  );
}