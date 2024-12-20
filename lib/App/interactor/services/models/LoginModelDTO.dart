class LoginModelDTO {
  String data;
  String token;

  LoginModelDTO({required this.data, required this.token});

  factory LoginModelDTO.fromJson(dynamic json) {
    return LoginModelDTO(data: json['data'], token: json['token']);
  }
}
