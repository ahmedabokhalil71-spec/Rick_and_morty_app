import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'no_internet_event.dart';
part 'no_internet_state.dart';

class NoInternetBloc extends Bloc<NoInternetEvent, NoInternetState> {
  final Connectivity connectivity;

  StreamSubscription<List<ConnectivityResult>>? connectivitySubscription;

  NoInternetBloc(this.connectivity) : super(NoInternetInitial()) {
    on<CheckInternetConnection>(_checkInternetConnection);
    on<InternetStatusChanged>(_internetStatusChanged);
  }

  Future<void> _checkInternetConnection(
    CheckInternetConnection event,
    Emitter<NoInternetState> emit,
  ) async {
    final hasInternet = await InternetConnection().hasInternetAccess;

    if (hasInternet) {
      emit(InternetConnectedState());
    } else {
      emit(InternetDisconnectedState());
    }

    connectivitySubscription = connectivity.onConnectivityChanged.listen((
      _,
    ) async {
      final hasInternet = await InternetConnection().hasInternetAccess;

      add(InternetStatusChanged(hasInternet));
    });
  }

  Future<void> _internetStatusChanged(
    InternetStatusChanged event,
    Emitter<NoInternetState> emit,
  ) async {
    if (event.isConnected) {
      emit(InternetConnectedState());
    } else {
      emit(InternetDisconnectedState());
    }
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
