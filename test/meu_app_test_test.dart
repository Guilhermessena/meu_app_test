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

  group('Calcula desconto de valor', () {
    var valuesToTest = {
      {"valor": 1000, "desconto": 150, "percentual": false}: 850,
      {"valor": 1000, "desconto": 15, "percentual": true}: 850,
    };
    valuesToTest.forEach((values, expected) {
      test('Entrada: $values - Esperado: $expected', () {
        expect(
            calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            equals(expected));
      });
    });
  });

  group('Calcula desconto de valor com valores zerados', () {
    var valuesToTest = {
      {"valor": 0, "desconto": 150, "percentual": false},
      {"valor": 1000, "desconto": 0, "percentual": true},
    };
    for (var values in valuesToTest) {
      test('Entrada: $values', () {
        expect(
            () => calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            equals(throwsA(TypeMatcher<ArgumentError>())));
      });
    }
  });
}
