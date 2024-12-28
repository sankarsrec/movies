import 'package:equatable/equatable.dart';

class ServerErrorEntity extends Equatable {
  final String errorMessage;

  const ServerErrorEntity({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [
        errorMessage,
      ];
}
