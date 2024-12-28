import 'package:equatable/equatable.dart';

import '../../data/core/app_exceptions.dart';

class ErrorEntity extends Equatable {
  const ErrorEntity({
    this.appErrorType,
    this.error,
    this.description,
    this.exception,
  });

  final AppErrorType? appErrorType;
  final String? error;
  final String? description;
  final dynamic exception;

  @override
  List<Object> get props => [
        appErrorType ?? '',
        error ?? '',
        description ?? '',
        exception,
      ];
}
