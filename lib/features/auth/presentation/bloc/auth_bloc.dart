import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym8/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:gym8/core/common/entities/user.dart';
import 'package:gym8/core/usecase/usecase.dart';
import 'package:gym8/features/auth/domain/usecases/user_sign_in.dart';
import 'package:gym8/features/auth/domain/usecases/user_sign_in_google.dart';
import 'package:gym8/features/auth/domain/usecases/user_sign_out.dart';
import 'package:gym8/features/auth/domain/usecases/user_sign_up.dart';
import 'package:gym8/features/auth/domain/usecases/current_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final UserSignInGoogle _userSignInGoogle;
  final UserSignOut _userSignOut;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required UserSignInGoogle userSignInGoogle,
    required UserSignOut userSignOut,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        _userSignInGoogle = userSignInGoogle,
        _userSignOut = userSignOut,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
    on<AuthSignInGoogle>(_onAuthSignInGoogle);
    on<AuthSignOut>(_onAuthSignOut);
    on<AuthIsUserSignedIn>(_isUserSignedIn);
  }

  void _isUserSignedIn(
    AuthIsUserSignedIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUser(NoParams());

    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userSignUp(
      UserSignUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ),
    );

    res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _onAuthSignIn(
    AuthSignIn event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userSignIn(
      UserSignInParams(
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _onAuthSignInGoogle(
    AuthSignInGoogle event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userSignInGoogle(
      NoParams(),
    );

    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => _emitAuthSuccess(r, emit),
    );
  }

  void _onAuthSignOut(
    AuthSignOut event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _userSignOut(
      NoParams(),
    );

    res.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => _emitAuthSuccess(null, emit),
    );
  }

  void _emitAuthSuccess(
    User? user,
    Emitter<AuthState> emit,
  ) {
    _appUserCubit.updateUser(user is User ? user : null);
    emit(user is User ? AuthSuccess(user) : AuthInitial());
  }
}
