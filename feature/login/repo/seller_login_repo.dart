import 'package:groomely_seller/core/api/api_string.dart';
import 'package:groomely_seller/feature/login/model/seller_login_res_model.dart';
import 'package:groomely_seller/utils/APi/api_provider.dart';

class LoginRepository{
  final apiProvider = ApiProvider();
  SellerLoginModel sellerLoginModel = SellerLoginModel();
  Future<dynamic> getLogin(Map<String,dynamic> reqModel){
    return apiProvider.dataProcessor(reqModel, sellerLoginModel,Apis.login);
  }
}
class NetworkError extends Error {}