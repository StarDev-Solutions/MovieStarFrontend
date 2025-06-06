import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  final int? statusCode;
  final bool connectionError;
  final String message;

  const Failure({
    this.statusCode,
    this.connectionError = false,
    required this.message,
  });

  @override
  String toString() => statusCode.toString() + message;
  
  @override
  List<Object?> get props => [message, statusCode];
}
