class BaseResponse<T> {
  String message;
  int status;
  T data;

  BaseResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        message: json['message'] != null
            ? json['message']['error'] ?? json['message']['success']
            : '',
        status: json['status'],
        data: json['data'],
      );
}
