import 'package:flutter_test/flutter_test.dart';
import 'package:heavyduty_front/App/interactor/services/treino_services.dart';

void main() {
  test('get all treinos', () async {
    final service = TreinoServices();
    var treinos = await service.getAll();
    expect(treinos.isNotEmpty, true);
  });
}
