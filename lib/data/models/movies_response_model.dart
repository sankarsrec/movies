import 'movies_data_model.dart';

class MoviesResponseModel {
  String status;
  String statusMessage;
  MoviesDataModel data;

  MoviesResponseModel({
    required this.status,
    required this.statusMessage,
    required this.data,
  });

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) =>
      MoviesResponseModel(
        status: json['status'],
        statusMessage: json['status_message'],
        data: MoviesDataModel.fromJson(json['data']),
      );
}
