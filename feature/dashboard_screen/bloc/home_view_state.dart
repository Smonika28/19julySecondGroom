part of 'home_view_bloc.dart';

abstract class HomeViewState {}
class HomeViewInitial extends HomeViewState {}
class HomeViewLoadingState extends HomeViewState{
}

class HomeViewLoadedState extends HomeViewState{
  HomeViewModel homeViewModel;
  HomeViewLoadedState({required this.homeViewModel});
}
class HomeViewErrorState extends HomeViewState{
  String errorMsg;
  HomeViewErrorState({required this.errorMsg});
}
