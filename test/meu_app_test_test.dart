import 'package:meu_app_test/meu_app_test.dart';
import 'package:test/test.dart';

void main() {
  test('Calcula desconto de valor sem percentual', () {
    expect(calcularDesconto(1000, 150, false), 850);
  });

  test('Calcula desconto de valor com percentual', () {
    expect(calcularDesconto(1000, 15, true), 850);
  });

  test('Calcula desconto de valor sem percentual com valor zerado', () {
    expect(() => calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula desconto de valor com percentual com valor zerado', () {
    expect(() => calcularDesconto(0, 150, true),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula desconto de valor sem percentual com desconto zerado', () {
    expect(() => calcularDesconto(1000, 0, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula desconto de valor com percentual com desconto zerado', () {
    expect(() => calcularDesconto(1000, 0, true),
        throwsA(TypeMatcher<ArgumentError>()));
  });
}
