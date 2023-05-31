import 'package:dio/dio.dart';
import 'package:fixgocompanyapp/data/api_constant/api_url.dart';
import 'package:fixgocompanyapp/data/data_constant/constant_data.dart';
import 'package:get_storage/get_storage.dart';



class ApiClient {

  final Dio _dio = Dio();


  Future<Map<String, dynamic>> login(String userNumber) async {

    String url = ApiConstants().baseUrl + ApiConstants().loginUrl;

    // print(GetStorage().read<String>(ConstantData.userType));

    try {
      Response response = await _dio.post<Map<String, dynamic>>(url,
        data: {
          'userType': GetStorage().read<String>(ConstantData.userType) == "1" ? ConstantData.COMPANY_USER : ConstantData.RECEIVER_USER,
          'phone': "+91$userNumber"
        },
      );
      print("loginSC --> ${response.statusCode}");
      print("loginData --> ${response.data}");
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }


  Future<Map<String, dynamic>> verifyOtp(String otp) async {

    String url = ApiConstants().baseUrl + ApiConstants().verifyOtpUrl;

    String? userType = GetStorage().read<String>(ConstantData.userType);
    String? userNumber = GetStorage().read<String>(ConstantData.userMobileNumber);
    String? userHash = GetStorage().read<String>(ConstantData.otpHashKey);

    print("$otp $userType $userNumber $userHash");

    try {
      Response response = await _dio.post<Map<String, dynamic>>(ApiConstants().baseUrl + ApiConstants().verifyOtpUrl,
        data: {
          'userType': userType == "1" ? ConstantData.COMPANY_USER : ConstantData.RECEIVER_USER,
          'phone': userNumber,
          'hash': userHash,
          'otp': otp
        },
      );
      print("verifyOtpSC --> ${response.statusCode}");
      print("verifyOtpData --> ${response.data}");

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }


  Future<Map<String, dynamic>> getUserProfileData() async {
    String url = ApiConstants().baseUrl + ApiConstants().userProfile;

    String? sessionToken = GetStorage().read<String>(
        ConstantData.userAccessToken);

    try {
      Response response = await _dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $sessionToken',
          },
        ),
      );

      print("getUserProfileDataSC --> ${response.statusCode}");
      print("getUserProfileData --> ${response.data}");

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<Map<String, dynamic>> editUserProfileData(
      String username,
      String companyName,
      String emailId,
      String companyAddress,
      /*List landLineNo,
      List mobileNo,*/
      String gstNo,
      String tinNo,
      String aadhaarNo,
      String panNo,
      bool loading
      ) async {

    String url = ApiConstants().baseUrl + ApiConstants().userEditProfile;

    String? sessionToken = GetStorage().read<String>(
        ConstantData.userAccessToken);

    try {
      Response response = await _dio.put(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $sessionToken',
          },
        ),
        data: {
            "name": username,
            "companyName": companyName,
            "email": emailId,
            "companyAddress": companyAddress,
            "gstNumber": gstNo,
            "tinNumber": tinNo,
            "panNumber": panNo,
            "aadharIDNumber": aadhaarNo,
            "landlines": ["1234", "5678"],
            "mobiles": ["4321", "8765"]
          }

      );

      print("editUserProfileDataSC --> ${response.statusCode}");
      print("editUserProfileData --> ${response.data}");

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  }