
import 'package:groomely_seller/core/api/api_string.dart';
import 'package:groomely_seller/feature/service/manage_service/model/service_model.dart';
import 'package:groomely_seller/utils/APi/api_provider.dart';
class ServiceRepo{
  final apiProvider = ApiProvider();
  ServiceModel serviceModel = ServiceModel();
  Future<dynamic> fetchServiceList(Map<String,dynamic> reqModel){
    return apiProvider.dataProcessor({},serviceModel, Apis.fetchServiceList);
  }
}
class NetworkError extends Error {}

