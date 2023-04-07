import 'package:equatable/equatable.dart';

import 'data.dart';

class LoginModel extends Equatable {
  final bool? status;
  final String? message;
  final Data? data;

  const LoginModel({this.status, this.message, this.data});

  factory LoginModel.fromMap(Map<String, dynamic> data) => LoginModel(
        status: data['status'] as bool?,
        message: data['message'] as String?,
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': data?.toMap(),
      };

  @override
  List<Object?> get props => [status, message, data];
}
