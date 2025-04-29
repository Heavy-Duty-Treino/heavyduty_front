import 'dart:convert';
import 'dart:io';

class CreateuserModel {
  final String nome_Usuario;
  final File foto_Perfil;
  final String email;
  final String senha;

  CreateuserModel({
    required this.nome_Usuario,
    required this.foto_Perfil,
    required this.email,
    required this.senha,
  });

  Map<String, dynamic> toJson() {
    // Converte o arquivo de imagem para base64
    final String fotoPerfilBase64 = base64Encode(foto_Perfil.readAsBytesSync());

    return {
      'nome_Usuario': nome_Usuario,
      'foto_Perfil': fotoPerfilBase64, // Envia a imagem como base64
      'email': email,
      'senha': senha,
    };
  }
}
