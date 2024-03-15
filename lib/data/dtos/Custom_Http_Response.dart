
class CustomHttpResponse {
  int? statusCode;
  bool? status;
  String? message;
  dynamic? data;
  
  CustomHttpResponse({
    this.statusCode,
    this.status,
    this.message,
    this.data
  });

  factory CustomHttpResponse.fromJson(Map<String, dynamic> json) {
    return CustomHttpResponse(
      statusCode : json['statusCode'],
      status : json['status'],
      message : json['message'],
      data : json['data']
    );
  }
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}