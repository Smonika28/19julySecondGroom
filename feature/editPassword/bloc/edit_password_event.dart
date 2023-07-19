
import 'package:equatable/equatable.dart';

abstract class EditPasswordEvent extends Equatable {
  const EditPasswordEvent();

  @override
  List<Object> get props => [];
}

class EditPasswordSubmittedEvent extends EditPasswordEvent {


  final String newPassword;
  final String confirmPassword;
  final String oldPassword;

  EditPasswordSubmittedEvent(
      {required this.newPassword,
      required this.confirmPassword,
      required this.oldPassword});

  @override
  List<Object> get props => [newPassword, confirmPassword, oldPassword];
}
