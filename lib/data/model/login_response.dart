
class LoginResponse {
  int id;
  String accessToken;
  String roll;

  LoginResponse({
    required this.id,
    required this.accessToken,
    required this.roll,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    id: json["id"],
    accessToken: json["access_token"],
    roll: json["roll"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "access_token": accessToken,
    "roll": roll,
  };
}
