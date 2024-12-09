import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_concluido_model.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';
import 'package:heavyduty_front/App/interactor/services/treino_concluido_service.dart';
import 'package:heavyduty_front/routes.g.dart';
import 'package:routefly/routefly.dart';

class ConcoluirTreinoPageController extends GetxController {
  late Rx<Treino> treino;
  var exercicios = <Exercicio>[].obs;
  final service = TreinoConcluidoService();

  void setTreino(Treino model) {
    treino = model.obs;
  }

  void setExercicio(id) {
    final exercicio =
        treino.value.exercicios.firstWhere((exer) => exer.exercicioId == id);
    exercicios.add(exercicio);
  }

  Rx<Exercicio> getExercicio(id) {
    return exercicios.firstWhere((exer) => exer.exercicioId == id).obs;
  }

  void addSerie(String idExercicio) {
    var index =
        exercicios.indexWhere((exer) => exer.exercicioId == idExercicio);
    var nextSerie = (exercicios[index].series.length + 1).toString();
    var newSerie = new Serie(tipoSerie: nextSerie, pesoKg: 0, repeticoes: 0);

    treino.value.exercicios[index].series.add(newSerie);
    treino.refresh();
  }

  void addSerieValue(
      String idExercicio, String? tipoSerie, int index, int? kg, int? reps) {
    Exercicio findExercicio = treino.value.exercicios
        .firstWhere((exercicio) => exercicio.exercicioId == idExercicio);

    if (tipoSerie != null) {
      treino.value.exercicios
          .firstWhere((e) => e.exercicioId == idExercicio)
          .series[index]
          .tipoSerie = tipoSerie;
    }

    if (kg != null) {
      treino.value.exercicios
          .firstWhere((e) => e.exercicioId == idExercicio)
          .series[index]
          .pesoKg = kg;
    }

    if (reps != null) {
      treino.value.exercicios
          .firstWhere((e) => e.exercicioId == idExercicio)
          .series[index]
          .repeticoes = reps;
    }
  }

  Future<void> concluir() async {
    var treinoConcluido = new TreinoConcluido(
        idTreino: treino.value.id,
        titulo: treino.value.titulo,
        nomeUsuario: treino.value.nomeUsuario,
        fotoPerfilUsuario: treino.value.fotoPerfilUsuario,
        exercicios: treino.value.exercicios);
    var response = await service.Create(treinoConcluido);
    if (response.statusCode == 200) return Routefly.navigate(routePaths.treino);
  }
  // void setSeries(String idExercicio) {
  //   final exercicio = treino.value.exercicios
  //       .firstWhere((exer) => exer.exercicioId == idExercicio);
  //   // series = treino.value.exercicios
  //   //     .firstWhere((exer) => exer.exercicioId == idExercicio)
  //   //     .series;
  //   series.assignAll(exercicio.series);
  //   // return treino.value.exercicios
  //   //     .firstWhere((exer) => exer.exercicioId == idExercicio)
  //   //     .series;
  // }

  // void addSerie(String idExercicio) {
  //   final exercicio = treino.value.exercicios
  //       .firstWhere((exer) => exer.exercicioId == idExercicio);

  //   var novaSerie = Serie(
  //     tipoSerie: exercicio.series.length.toString(),
  //     pesoKg: 0,
  //     repeticoes: 0,
  //   );

  //   exercicio.series.add(novaSerie);
  //   series.assignAll(exercicio.series);
  // }
}
