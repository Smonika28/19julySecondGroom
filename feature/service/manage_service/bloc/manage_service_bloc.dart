import 'package:bloc/bloc.dart';
import 'package:groomely_seller/feature/service/manage_service/model/service_model.dart';
import 'package:groomely_seller/feature/service/repo/service_repo.dart';
import 'package:meta/meta.dart';

part 'manage_service_event.dart';
part 'manage_service_state.dart';

class ManageServiceBloc extends Bloc<ManageServiceEvent, ManageServiceState> {
  ManageServiceBloc() : super(ManageServiceInitial()) {
    ServiceRepo serviceRepo = ServiceRepo();
    on<FetchServiceListEvent>((event, emit) async {
      emit(ManageServiceDataLoadingState());
      try {
        emit(ManageServiceDataLoadingState());
        final myList = await serviceRepo.fetchServiceList({});
        if (myList != null && myList.status==true) {
          emit(ManageServiceDataLoadedState(serviceModel: myList));
        } else {
          emit(
              ManageServiceDataErrorState(erromMsg: myList.message.toString()));
        }
      } on NetworkError {
        emit(ManageServiceDataErrorState(erromMsg: "No Internet Connection"));
      }
    });
  }
}



