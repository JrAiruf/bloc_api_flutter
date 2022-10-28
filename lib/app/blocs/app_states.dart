// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

import 'package:bloc_api_flutter/app/models/user_model.dart';

@immutable
abstract class UserStates {}

class UserInitialState extends UserStates {
  final List<UserModel> users = [];
  @override
  List<Object?> get props => [];
}

class UserLoadingState extends UserStates {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserStates {
  UserLoadedState(this.users);

  final List<UserModel> users;
  @override
  List<Object?> get props => [users];
}

class UserErrorState extends UserStates {
  final String message;

  UserErrorState(this.message);
  @override
  List<Object?> get props => [message];
}
