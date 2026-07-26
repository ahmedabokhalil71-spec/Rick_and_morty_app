part of 'no_internet_bloc.dart';

sealed class NoInternetState {}

final class NoInternetInitial extends NoInternetState {}

final class InternetConnectedState extends NoInternetState {}

final class InternetDisconnectedState extends NoInternetState {}
