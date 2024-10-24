import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heavyduty_front/App/(public)/exercicios_page.dart';
import 'package:heavyduty_front/App/components/base_button.dart';
import 'package:heavyduty_front/App/components/base_screem.dart';
import 'package:heavyduty_front/App/components/card_exercicio.dart';
import 'package:heavyduty_front/App/interactor/controllers/criarTreinoPageController.dart';
import 'package:heavyduty_front/App/interactor/controllers/exercicioController.dart';
import 'package:heavyduty_front/App/interactor/services/models/exercicio_model.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';

class CriarTreinoPage extends StatefulWidget {
  const CriarTreinoPage({super.key});

  @override
  State<CriarTreinoPage> createState() => _CriarTreinoPageState();
}

class _CriarTreinoPageState extends State<CriarTreinoPage> {
  final Exerciciocontroller controller = Get.put(Exerciciocontroller());
  final TextEditingController _titleController = TextEditingController();
  final Criartreinopagecontroller treinoController =
      Get.put(Criartreinopagecontroller());

  void AddExercicio() async {
    final List<ExercicioModel>? resultados = await Routefly.push('/exercicios');
    if (resultados != null) {
      controller.selectExercicios(resultados);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.only(top: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Criar novo treino'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BaseButton(
                    title: 'Voltar',
                    ph: 20,
                    pv: 5,
                    onPressed: () {
                      Routefly.navigate(routePaths.treino);
                    }),
                BaseButton(
                    title: 'Criar treino',
                    ph: 20,
                    pv: 5,
                    onPressed: () {
                      treinoController.CreateTreino(_titleController.text);
                    })
              ],
            ),
          ]),
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(hintText: 'Digite o titulo do treino'),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.selectedExercicios.length +
                    1, // Adiciona +1 para incluir o botão
                itemBuilder: (context, index) {
                  if (index == controller.selectedExercicios.length) {
                    // Quando o índice é igual ao tamanho da lista, renderiza o botão
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed:
                            AddExercicio, // Função para adicionar novo exercício
                        child: Text('Adicionar um exercício'),
                      ),
                    );
                  }
                  final exercicio = controller.selectedExercicios[index];
                  return CardExercicio(
                    idExercicio: exercicio.exercicioId,
                    title: exercicio.nomeExercicio,
                    showColum: false,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}


// Expanded(
//         child: ListView.builder(
//             itemCount: exercicios.length,
//             itemBuilder: (_, index) {
//               final exercicio = exercicios[index];
//               if (index == exercicios.length) {
//                 return ElevatedButton(
//                     onPressed: AddExercicio,
//                     child: Text('Adicionar um exercicio'));
//               }
//               return exercicio;
//             }),
//       )

// if (index == exercicios.length) {
//               // Quando o índice é igual ao tamanho da lista, renderiza o botão
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   onPressed:
//                       AddExercicio, // Função para adicionar novo exercício
//                   child: Text('Adicionar um exercício'),
//                 ),
//               );
//             }