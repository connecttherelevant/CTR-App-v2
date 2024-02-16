import 'package:dio/dio.dart';
import 'package:musicidia/core/network/base_api.dart';
import 'package:musicidia/core/network/client/api_client.dart';
import 'package:musicidia/core/network/model/base_response.dart';

class AuthApiSource extends BaseApi {
  //send verification code header , no header need to sent
  Stream<BaseResponse> sendVerificationCode(String mobile) {
    print("CALLED $mobile");
    return callApi(ApiClient().dio().post(
          'user/otpSent',
          data: {'contact_no': mobile},
          options: Options(headers: {ApiClient.requiresHeader: false}),
        )).map((response) {
      print("========response====== AuthApi");
      return BaseResponse.fromJson(response.data);
    });
  }
}
