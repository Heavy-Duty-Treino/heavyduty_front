import 'package:flutter/material.dart';
import 'package:heavyduty_front/App/interactor/controllers/exercicioController.dart';

class ModalButtonExercicios extends StatelessWidget {
  final Exerciciocontroller controller;
  const ModalButtonExercicios({super.key, required this.controller});

  void _abrirModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Filtrar por grupo muscular",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                ...[
                  "Peito",
                  "Costas",
                  "Ombros",
                  "Bíceps",
                  "Tríceps",
                  "Pernas",
                  "Glúteos",
                  "Panturrilhas",
                  "Abdômen",
                  "Antebraços",
                  "Trapézio",
                  "Cardio"
                ].map((grupo) => ListTile(
                      leading: const Icon(Icons.fitness_center),
                      title: Text(grupo),
                      onTap: () {
                        controller.filtro.value = grupo;
                        Navigator.pop(context); // Fecha o modal
                      },
                    )),
                ListTile(
                  leading: const Icon(Icons.clear),
                  title: const Text("Limpar Filtro"),
                  onTap: () {
                    controller.filtro.value = "";
                    Navigator.pop(context); // Fecha o modal
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _abrirModal(context),
      child: const Text("Abrir Filtros"),
    );
  }
}
