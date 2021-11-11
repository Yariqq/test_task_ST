
import 'package:dio/dio.dart' as dio;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app_st_my/features/exchange_rates/data/datasources/exchange_rates_remote_data_source.dart';

class MockDioClient extends Mock implements dio.Dio {}

void main() {
  ExchangeRatesRemoteDataSourceImpl dataSource;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    dataSource = ExchangeRatesRemoteDataSourceImpl(mockDioClient);
  });

  final tResponse = [
    {
      "Cur_ID": 1,
      "Date": "2021-11-03T00:00:00",
      "Cur_Abbreviation": "Test",
      "Cur_Scale": 1,
      "Cur_Name": "TestName",
      "Cur_OfficialRate": 2.0,
    },
    {
      "Cur_ID": 2,
      "Date": "2021-11-04T00:00:00",
      "Cur_Abbreviation": "Test1",
      "Cur_Scale": 2,
      "Cur_Name": "TestName1",
      "Cur_OfficialRate": 2.1,
    }
  ];

  // test(
  //   'should perform a GET request on URL',
  //       () async {
  //     when(mockDioClient.get(
  //         'https://www.nbrb.by/api/exrates/rates?periodicity=0'))
  //         .thenAnswer((_) async => dio.Response(data: tResponse, statusCode: 200));
  //   },
  // );
}