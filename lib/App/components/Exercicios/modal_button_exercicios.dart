import 'package:flutter/material.dart';

class ModalButtonExercicios extends StatelessWidget {
  const ModalButtonExercicios({super.key});

  void _abrirModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 300,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Filtrar Exercícios",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              // Aqui você pode colocar inputs, checkboxes, botões, etc
              Text("Opção 1"),
              Text("Opção 2"),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _abrirModal(context),
      child: const Text("Abrir Filtros"),
    );
  }
}
