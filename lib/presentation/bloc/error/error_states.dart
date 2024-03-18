import 'package:flutter_bloc_clean_arch/presentation/bloc/app/app_state.dart';

// Specific states extending the base error state
class TimeoutErrorState extends AppState {
  final String message;
  TimeoutErrorState(this.message);

  @override
  List<Object?> get props => [];
}

class UnauthorizedErrorState extends AppState {
  final String message;
  UnauthorizedErrorState(this.message);

  @override
  List<Object?> get props => [];
}

class ConnectivityErrorState extends AppState {
  final String message;
  ConnectivityErrorState(this.message);

  @override
  List<Object?> get props => [];
}

class GeneralErrorState extends AppState {
  final String message;
  GeneralErrorState(this.message);

  @override
  List<Object?> get props => [];
}