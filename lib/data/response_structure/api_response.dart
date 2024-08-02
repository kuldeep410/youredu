class ApiResponse<T> {
  int? httpCode;
  bool? success;
  String? message;
  T? data;
  T? error;

  ApiResponse(
      {this.httpCode, this.success, this.message, this.data, this.error});

  @override
  String toString() {
    return '${error ?? ''}';
  }
}
