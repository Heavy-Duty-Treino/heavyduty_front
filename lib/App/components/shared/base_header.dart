import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BaseHeader extends StatelessWidget {
  final Future<String> Function() getImage;
  final Future<String> Function() getName;

  const BaseHeader({
    super.key,
    required this.getImage,
    required this.getName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: FutureBuilder<String>(
                future: getImage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return const Icon(Icons.account_circle, size: 50);
                  }

                  if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Icon(Icons.account_circle, size: 50);
                  }

                  return SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  '${toBeginningOfSentenceCase(DateFormat.EEEE('pt_BR').format(DateTime.now()))}, ${DateFormat('dd MMMM', 'pt_BR').format(DateTime.now())}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
