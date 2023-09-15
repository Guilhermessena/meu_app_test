import 'package:meu_app_test/classes/viacep.dart';
import 'package:meu_app_test/meu_app_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateMocks([MockViaCep])
void main() {
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

  test('Conversão para UpperCase', () {
    expect(convertUpperCase("dio"), equals("DIO"));
  });

  test('Verifica numero acima de 50', () {
    expect(retornaNum(50), greaterThan(49));
  });

  test('Começa com', () {
    expect(convertUpperCase("dio"), startsWith("D"));
  });

  test('Verifica se numero não é 50', () {
    expect(retornaNum(50), isNot(49));
  });

  test('Verifica informações cep', () async {
    ViaCep viaCep = ViaCep();
    var body = await viaCep.retornaCep('01001000');
    expect(body["bairro"], equals("Sé"));
    expect(body["logradouro"], equals("Praça da Sé"));
  });
}

class MockViaCep extends Mock implements ViaCep {}
