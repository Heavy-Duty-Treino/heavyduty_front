import 'package:get/get.dart';
import 'package:heavyduty_front/App/interactor/services/exercicio_services.dart';
import 'package:heavyduty_front/App/interactor/services/models/exercicio_model.dart';
import 'package:heavyduty_front/App/interactor/services/models/treino_model.dart';

class Exerciciocontroller extends GetxController {
  var service = ExercicioServices();
  var exercicios = <ExercicioModel>[].obs;
  var selectedExercicios = <Exercicio>[].obs;

  Future<void> getAllExercicios() async {
    var result = await service.getAll();
    exercicios.assignAll(result);
  }

  void selectExercicios(List<ExercicioModel> model) {
    selectedExercicios.addAll(model.map((exercicioModel) {
      return Exercicio(
          exercicioId: exercicioModel.id,
          imageUrl: exercicioModel.image_Url,
          nomeExercicio: exercicioModel.nome_exercicio,
          tipoExercicio: exercicioModel.tipo_exercicio,
          musculoAlvo: exercicioModel.musculo_alvo,
          musculosSinergistas: exercicioModel.musculos_sinergistas,
          categoriaExercicio: exercicioModel.categoria_exercicio,
          series: <Serie>[],
          descansoSegundos: 0);
    }));
  }

  void addNewSerie(String idExercicio, String tipoSerie) {
    var newSerie = Serie(tipoSerie: tipoSerie, pesoKg: 0, repeticoes: 0);
    Exercicio findExercicio = selectedExercicios
        .firstWhere((exercicio) => exercicio.exercicioId == idExercicio);

    findExercicio.series.add(newSerie);
  }

  void addSerieValue(
      String idExercicio, int index, String? tipoSerie, int? kg, int? reps) {
    Exercicio findExercicio = selectedExercicios
        .firstWhere((exercicio) => exercicio.exercicioId == idExercicio);

    if (tipoSerie != null) findExercicio.series[index].tipoSerie = tipoSerie;
    if (kg != null) findExercicio.series[index].pesoKg = kg;
    if (reps != null) findExercicio.series[index].repeticoes = reps;
    selectedExercicios.refresh();
  }

  String GetTypeSerie(String idExercicio, int index) {
    Exercicio findExercicio = selectedExercicios
        .firstWhere((exercicio) => exercicio.exercicioId == idExercicio);

    try {
      var result = findExercicio.series[index].tipoSerie;
      return result;
    } catch (e) {
      return index.toString();
    }
  }

  void clear() {
    selectedExercicios.value = [];
  }
}
