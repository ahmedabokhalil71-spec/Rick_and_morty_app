import 'package:rick_and_morty_app/core/netWork/error_massege_model.dart';

class SereverExcpation implements Exception {
  final ErrorMessageModel errorMassegeModel;
  SereverExcpation({required this.errorMassegeModel});
}
