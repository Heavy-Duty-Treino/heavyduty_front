class Usuario {
  final String nomeUsuario;
  final String email;
  final String imageUrl;

  Usuario({
    required this.nomeUsuario,
    required this.email,
    required this.imageUrl,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nomeUsuario: json['nome_Usuario'],
      email: json['email'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome_Usuario': nomeUsuario,
      'email': email,
      'image_url': imageUrl,
    };
  }
}

class LoginModelDTO {
  String data;
  String token;
  Usuario usuario;

  LoginModelDTO(
      {required this.data, required this.token, required this.usuario});

  factory LoginModelDTO.fromJson(dynamic json) {
    return LoginModelDTO(
      data: json['data'],
      token: json['token'],
      usuario: Usuario.fromJson(json['usuario']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'token': token,
      'usuario': usuario.toJson(),
    };
  }
}
