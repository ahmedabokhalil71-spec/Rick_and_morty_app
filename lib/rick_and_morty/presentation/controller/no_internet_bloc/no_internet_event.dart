part of 'no_internet_bloc.dart';

sealed class NoInternetEvent {}

class CheckInternetConnection extends NoInternetEvent {}

class InternetStatusChanged extends NoInternetEvent {
  final bool isConnected;

  InternetStatusChanged(this.isConnected);
}
