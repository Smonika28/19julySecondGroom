import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:groomely_seller/core/api/api_string.dart';
import 'package:groomely_seller/utils/APi/api_provider.dart';
import 'package:groomely_seller/utils/storage/local_storage.dart';
import '../model/seller_signup_res_model.dart';

class SignupRepository{
  final Dio _dio = Dio();
  LocalStorageService localStorageService = LocalStorageService();
  final apiProvider = ApiProvider();
  SellerSignupModel sellerSignupModel = SellerSignupModel();
  Future<SellerSignupModel> getSignup(Map<String,dynamic> reqModel)async {
    String resMsg = "";

    try{
     var response = await _dio.post(Apis.signup,data: reqModel);
     print('response --> $response');
     // var jsonResponse = json.decode(response.data);
     print("jsonResponse--> ${response.data}");

      if(response.statusCode ==200){
        // resMsg = jsonResponse['message'];
        print(resMsg);
        sellerSignupModel = SellerSignupModel.fromJson(response.data);
        print("sellerSignupModel--> ${sellerSignupModel.token}");
        print("sellerSignupModel--> ${sellerSignupModel.status}");
        return sellerSignupModel;
      }
      else {
        throw NetworkError();
      }


    }
    catch(e){
      print("error");
      return sellerSignupModel;
    }





    // return apiProvider.dataProcessor(reqModel, sellerSignupModel,Apis.signup);
    //return apiProvider.dataProcessor(reqModel, sellerSignupModel,Apis.signup);

  }
}

class NetworkError extends Error {}
