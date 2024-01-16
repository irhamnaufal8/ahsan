class DataResponse<T> {
  int? code;
  String? status;
  T? data;

  DataResponse({
    this.code,
    this.status,
    this.data,
  });

  factory DataResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic json) fromJsonT) {
    return DataResponse(
      code: json['code'],
      status: json['status'],
      data: fromJsonT(json['data']),
    );
  }
}

class ListResponse<T> {
  int? code;
  String? status;
  List<T>? data;

  ListResponse({
    this.code,
    this.status,
    this.data,
  });

  factory ListResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return ListResponse(
      code: json['code'],
      status: json['status'],
      data: (json['data'] as List).map((e) => fromJsonT(e)).toList(),
    );
  }
}
