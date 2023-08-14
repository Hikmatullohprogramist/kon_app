// To parse this JSON data, do
//
//     final BaseResponse = BaseResponseFromJson(jsonString);


 
class BaseResponse {
  int currentPage;
  int limit;
  int pages;
  dynamic data;

  BaseResponse({
    required this.currentPage,
    required this.limit,
    required this.pages,
    required this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
    currentPage: json["current_page"],
    limit: json["limit"],
    pages: json["pages"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "limit": limit,
    "pages": pages,
    "data": data,
  };
}
