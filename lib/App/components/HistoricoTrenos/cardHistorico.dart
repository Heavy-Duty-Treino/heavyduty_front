import 'package:flutter/material.dart';

class CardHistoricoPage extends StatelessWidget {
  const CardHistoricoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Grupo: ícone + nome
              Row(
                children: [
                  Icon(Icons.account_circle, size: 50),
                  SizedBox(width: 8), // espaçamento entre ícone e texto
                  Text("Nome do Usuário"),
                ],
              ),
              Text("Data"),
            ],
          ),
          Text("Titulo"),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey[900]),
            padding: const EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Supino reto"),
              const SizedBox(
                height: 12,
              ),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Musculo Alvo: ",
                    style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: "Peito", style: TextStyle(color: Colors.lightBlue))
              ])),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Musculo Sinergista: ",
                    style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: "Ombros e Triceps",
                    style: TextStyle(color: Colors.lightBlue))
              ])),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Equipamento: ",
                    style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: "Halteres", style: TextStyle(color: Colors.lightBlue))
              ])),
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: "Descanso: ", style: TextStyle(color: Colors.white)),
                TextSpan(
                    text: "120 Segundos",
                    style: TextStyle(color: Colors.lightBlue))
              ])),
              Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ))
            ]),
          )
        ],
      ),
    );
  }
}
