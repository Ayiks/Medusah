
import 'package:get/get.dart';
import 'package:medusah/utils/app_constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type': 'application/json; charset= UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  //GET REQUEST
Future<Response> getData(String uri) async{
    try {
     Response response = await get(uri);
     return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
}

//POST REQUEST
  Future<Response> postData(String uri, Map<String, dynamic> data) async {
    try {
      Response response = await post(uri, data);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  //UPDATE REQUEST
Future<Response> updateData(String uri, Map<String, dynamic> data) async{
    try{
      Response response = await patch(uri, data);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
}
}