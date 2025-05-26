import 'package:flutter_test/flutter_test.dart';
import 'package:heavyduty_front/App/interactor/services/treino_concluido_service.dart';

void main() {
  test('get all treinos concluidos', () async {
    final service = TreinoConcluidoService();
    final treinosConcluidos = await service.getAll("ramon@gmail.com");
    print(treinosConcluidos.first.dataCriacao);
    expect(treinosConcluidos.isNotEmpty, true);
  });
}
