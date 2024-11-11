import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';

class ConcoluirTreinoPageController extends GetxController {
  late Rx<Treino> treino;
  var exercicios = <Exercicio>[].obs;

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
