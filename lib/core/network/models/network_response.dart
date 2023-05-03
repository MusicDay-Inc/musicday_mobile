import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_response.freezed.dart';

@freezed
class NetworkResponse<T> with _$NetworkResponse<T> {
  const factory NetworkResponse.serverError(int code) = ServerError;
  const factory NetworkResponse.serverNotAvailable() = ServerNotAvailable;
  const factory NetworkResponse.ok(T data) = Ok;
}
