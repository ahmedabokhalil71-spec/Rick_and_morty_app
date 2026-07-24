import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String error;

  const ErrorMessageModel({required this.error});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(error: json["error"] ?? "Unknown Error");
  }

  @override
  List<Object?> get props => [error];
}
