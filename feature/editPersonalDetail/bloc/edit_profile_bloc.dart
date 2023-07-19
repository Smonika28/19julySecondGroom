import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:groomely_seller/core/api/api_string.dart';
import 'package:groomely_seller/feature/editPersonalDetail/model/edit_profile_response_model.dart';
import 'package:groomely_seller/utils/APi/api_calling.dart';

import '../../../utils/APi/api_provider.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileStateInitial()) {
    EditProfileResponseModel editProfileModel = EditProfileResponseModel();
    ApiProvider apiProvider = ApiProvider();

    on<EditProfileSubmittedEvent>((event, emit) async {
      Map<String, dynamic> requestModel = {
        'shop_name': event.shopName.toString(),
        'name': event.shopOwnerName.toString(),
        //'email': event.email.toString(),
        'phone': event.phone.toString(),
        'shop_address': event.address.toString(),
      };

      try {
        emit(EditProfileStateLoading());

       // final response = apiCallingClass.updateProfile(stShopName: event.shopName,stShopEmail: event.email, stOwnerName: event.shopOwnerName, stShopPhone: event.phone, stShopAddress: event.address);
        final myData = await apiProvider
            .dataProcessor(requestModel,editProfileModel, Apis.sellerUpdateProfile);
        if(myData!= null && myData.status == true) {
          print('update  profile Response ---------------------- ${myData}');
          emit(EditProfileStateLoaded(myData));
        }
        else{
          emit(EditProfileStateFailed(myData.toString()));
        }

      } catch (e) {
        emit(EditProfileStateFailed(e.toString()));
      }


    });
  }
}
