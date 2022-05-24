import 'package:product_catalog/src/h.dart';

part 'wrapped_object_response.g.dart';

@JsonSerializable()
class WrappedObjectResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status")
  bool? status;
  @JsonKey(name: "data")
  Map<String, dynamic>? data;

  WrappedObjectResponse({
    this.message,
    this.status,
    this.data,
  });

  factory WrappedObjectResponse.fromJson(Map<String, dynamic> json) =>
      _$WrappedObjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WrappedObjectResponseToJson(this);
}
