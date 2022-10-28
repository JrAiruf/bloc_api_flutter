import 'package:bloc_api_flutter/app/blocs/app_events.dart';
import 'package:bloc_api_flutter/app/blocs/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repos/user_repo.dart';

class UserBloc extends Bloc<UserEvents, UserStates> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<UserInitialEvent>((event, emit) async {
      emit(UserInitialState());

      on<LoadUserEvent>((event, emit) async {
        emit(UserLoadingState());
        try {
          final users = await _userRepository.getUsers();
          emit(UserLoadedState(users));
        } catch (e) {
          emit(UserErrorState(e.toString()));
        }
      });
    });
  }
}
