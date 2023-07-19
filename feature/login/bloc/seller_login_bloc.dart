import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:groomely_seller/feature/login/model/seller_login_res_model.dart';
import 'package:groomely_seller/feature/login/repo/seller_login_repo.dart';
import 'package:groomely_seller/utils/storage/local_storage.dart';
import 'package:meta/meta.dart';
part 'seller_login_event.dart';
part 'seller_login_state.dart';

class SellerLoginBloc extends Bloc<SellerLoginEvent, SellerLoginState> {
  SellerLoginBloc() : super(SellerLoginInitial()) {
    LoginRepository repository = LoginRepository();
    on<SellerLoginEvents>((event, emit) async {
      Map<String, dynamic> requestModel = {
        "email": event.userName,
        "password": event.password,
        "user_type":"BUSINESS_OWNER"
      };
      try {
        emit(SellerLoginLodingState());
        // print(requestModel);
        final myList = await repository.getLogin(requestModel);
        // print('myListdata--> $myList');
        // print("statusss-->  ${myList.status}");
        if (myList.status == true) {
          LocalStorageService()
              .saveToDisk(LocalStorageService.ACCESS_TOKEN_KEY, myList.data.authToken);
          emit(SellerLoginLoadedState(responseModel: myList));
        } else {
          emit(SellerLoginErrorState(errorMsg: myList.message.toString()));
        }
      } on NetworkError {
        emit(SellerLoginErrorState(errorMsg: "No Internet Connection"));
      }
    });
  }
}
