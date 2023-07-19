import 'package:bloc/bloc.dart';
import 'package:groomely_seller/core/api/api_string.dart';
import 'package:groomely_seller/feature/profile/model/profile_model.dart';
import 'package:groomely_seller/utils/APi/api_provider.dart';
import 'package:meta/meta.dart';
part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileInitial()) {
   ProfileModel profileModel = ProfileModel();
    ApiProvider apiProvider = ApiProvider();
     on<FetchProfileEvent>((event, emit) async {
      try {
        emit((UserProfileLoadingState()));
        final myData = await apiProvider
            .dataProcessor({},profileModel, Apis.getUser);
        print("my data--> $myData");
        if (myData != null && myData.status == true) {
          print("loaded--> ${myData.toJson()}");
          emit(UserProfileLoadedState(profileModel: myData));
        } else {
          emit(UserProfileErrorState(errorMsg: myData.toString()));
        }
      } catch (e) {
        emit(UserProfileErrorState(errorMsg: e.toString()));
      }
    });
  }
}
