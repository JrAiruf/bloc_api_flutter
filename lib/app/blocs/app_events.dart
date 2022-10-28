import 'package:flutter/cupertino.dart';

@immutable
abstract class UserEvents {
  const UserEvents();
}
class UserInitialEvent extends UserEvents {
  @override
  List<Object?> get props => [];
}
class LoadUserEvent extends UserEvents {
  @override
  List<Object?> get props => [];
}

class LoadedUserEvent extends UserEvents {
  @override
  List<Object?> get props => [];
}