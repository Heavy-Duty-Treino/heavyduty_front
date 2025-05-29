import 'package:flutter/material.dart';

class BaseHeaderUsuario extends StatelessWidget {
  final Future<String> Function() getImage;
  final Future<String> Function() getName;
  final Future<String> Function() getEmail;

  const BaseHeaderUsuario({
    super.key,
    required this.getImage,
    required this.getName,
    required this.getEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Imagem do usuário
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: FutureBuilder<String>(
              future: getImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return const Icon(Icons.account_circle, size: 100);
                }

                if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return const Icon(Icons.account_circle, size: 100);
                }

                return SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    snapshot.data!,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          FutureBuilder<String>(
            future: getName(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return const Text("Erro ao buscar nome");
              }
              return Text(
                snapshot.data!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              );
            },
          ),
          FutureBuilder<String>(
            future: getEmail(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return const Text("Erro ao buscar nome");
              }
              return Text(
                snapshot.data!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              );
            },
          )
        ],
      ),
    );
  }
}
