import 'package:dio/dio.dart';

String headUrl = 'http://185.231.115.148:3698/api/';
String apikey =
    '1529c8c2-0309-47de-95e5-632efa2ccafd-48b3dc62-560d-4f94-a01d-6b2439551c02';

String checkSessionUrl = '${headUrl}checkSession/';
String sendCodeToPhoneUrl = '${headUrl}sendCodeToPhone/';
String checkVerifyCodeUrl = '${headUrl}checkVerifyCode/';
String userRegistrationUrl = '${headUrl}userRegistration/';
String getMiniBookUrl = '${headUrl}getMiniBook/';

privateHeader() {
  return Options(
    headers: {
      'API-X-KEY': apikey,
      'Session': 'session',
    },
  );
}

publicHeader() {
  return Options(
    headers: {'API-X-KEY': apikey},
  );
}

class Api {
  //

  checkSessionApi({
    required String session,
  }) async {
    final response = await Dio().post(
      checkSessionUrl,
      options: publicHeader(),
      data: {
        'Session': session,
      },
    ).timeout(const Duration(seconds: 10));

    return response;
  }

  sendCodeToPhone({
    required String phone,
  }) async {
    final response = await Dio().post(
      sendCodeToPhoneUrl,
      options: publicHeader(),
      data: {
        'Phone': phone,
      },
    ).timeout(const Duration(seconds: 10));

    return response;
  }

  checkVerifyCode({
    required String phone,
    required String code,
  }) async {
    final response = await Dio().post(
      checkVerifyCodeUrl,
      options: publicHeader(),
      data: {
        'Phone': phone,
        'Code': code,
      },
    ).timeout(const Duration(seconds: 10));

    return response;
  }

  userRegistration({
    required String phone,
    required String name,
    required String family,
    required int gender,
  }) async {
    final response = await Dio().post(
      userRegistrationUrl,
      options: publicHeader(),
      data: {
        'Phone': phone,
        'Name': name,
        'Family': family,
        'Gender': gender,
      },
    ).timeout(const Duration(seconds: 10));

    return response;
  }

  getMiniBook() async {
    final response = await Dio()
        .get(
          getMiniBookUrl,
          options: publicHeader(),
        )
        .timeout(const Duration(seconds: 10));

    return response;
  }
}
