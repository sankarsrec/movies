import '../../domain/entities/server_error_entity.dart';

class ServerErrorModel extends ServerErrorEntity {
  final String message;

  const ServerErrorModel({
    required this.message,
  }) : super(
          errorMessage: message,
        );

  static ServerErrorModel get empty => const ServerErrorModel(
        message: '',
      );

  factory ServerErrorModel.fromJson(Map<String, dynamic> json) =>
      ServerErrorModel(
        message: json['message'] as String? ?? '',
      );
}
