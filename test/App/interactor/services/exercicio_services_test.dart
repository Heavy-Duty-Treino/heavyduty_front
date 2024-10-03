import 'package:flutter_test/flutter_test.dart';
import 'package:heavyduty_front/App/interactor/services/exercicio_services.dart';

void main() {
  test('Get All Exercicios', () async {
    final service = ExercicioServices();
    var exercicios = await service.getAll();
    expect(exercicios.length > 1, true);
  });
}
