import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:groomely_seller/feature/signup/model/request_model.dart';
import 'package:groomely_seller/feature/signup/model/seller_signup_res_model.dart';

import '../../../core/api/api_string.dart';
import '../../../utils/APi/api_provider.dart';

part 'seller_signup_event.dart';

part 'seller_signup_state.dart';

class SellerSignupBloc extends Bloc<SellerSignupEvent, SellerSignupState> {
  SellerSignupBloc() : super(SellerSignupStateInitial()) {
    SellerSignupModel sellerSignupModel = SellerSignupModel();
    ApiProvider apiProvider = ApiProvider();

    on<SellerSignupSubmittedEvent>((event, emit) async {
      SellerSignupRequestModel requestModel = SellerSignupRequestModel(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email,
          phone: event.phone,
          zipcode: event.zipcode,
          password: event.password,
          confirmPassword: event.confirmPassword,
          userType: "BUSINESS_OWNER");


      try {
        emit(SellerSignupStateLoading());
       final myData = await apiProvider.dataProcessor(
            requestModel.toJson(), sellerSignupModel, Apis.signup);
        //if (myData != null && myData.status == true) {
          //print('seller signup  Response ---------------------- ${myData.fromJson(myData.data)}');
          emit(SellerSignupStateLoaded(jsonDecode(myData.data)));
        //}
        // else {
        //   emit(SellerSignupStateFailed(myData));
        // }
      } catch (e) {
        emit(SellerSignupStateFailed(e.toString()));
      }
    });
  }
}
