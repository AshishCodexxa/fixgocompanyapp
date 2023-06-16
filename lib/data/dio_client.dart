import 'package:dio/dio.dart';
import 'package:fixgocompanyapp/data/api_constant/api_url.dart';
import 'package:fixgocompanyapp/data/data_constant/constant_data.dart';
import 'package:get_storage/get_storage.dart';



class ApiClient {

  final Dio _dio = Dio();


/////////////////////// User Authentication Api ////////////////////////////////


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
      Response response = await _dio.post<Map<String, dynamic>>(url,
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


/////////////////////// Company PickUp Address Api ///////////////////////////////////////


  Future<Map<String, dynamic>> getAllPickUpAddressList() async {

    String url = ApiConstants().baseUrl + ApiConstants().allPickUpAddress;

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

      print("getAllPickUpAddressListSC --> ${response.statusCode}");
      print("getAllPickUpAddressList --> ${response.data}");

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<Map<String, dynamic>> createPickUpAddress(
      String personName,
      String phoneNo,
      String street,
      String city,
      String state,
      String country,
      String pinCode,
      String lat,
      String long,
      ) async {

    String url = ApiConstants().baseUrl + ApiConstants().createPickUpAddress;

    String? sessionToken = GetStorage().read<String>(
        ConstantData.userAccessToken);

    try {
      Response response = await _dio.post<Map<String, dynamic>>(url,
        data: {
          "name": personName,
          "phone": phoneNo,
          "address": {
            "street": street,
            "city": city,
            "state": state,
            "country": country,
            "postalCode": pinCode
          },
          "coordinate": {
            "latitude": lat,
            "longitude": long
          }
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $sessionToken',
          },
        ),
      );
      print("createPickUpAddressSC --> ${response.statusCode}");
      print("createPickUpAddressData --> ${response.data}");
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }



/////////////////////// Company Post Api ///////////////////////////////////////


  Future<Map<String, dynamic>> getCompanyAllPost() async {

    String url = "${ApiConstants().baseUrl}${ApiConstants().companyAllPost}${ConstantData.PENDING_POST}";

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

      print("getCompanyAllPostSC --> ${response.statusCode}");
      print("getCompanyAllPost --> ${response.data}");

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }


  /*Future<Map<String, dynamic>> getAllBidsAgainstPostLimited(String postId) async {

    String url = "${ApiConstants().baseUrl}post/bid/$postId/?limit=3";

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

      print("getAllBidsAgainstPostLimitedSC --> ${response.statusCode}");
      print("getAllBidsAgainstPostLimitedData --> ${response.data}");

      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }*/


}