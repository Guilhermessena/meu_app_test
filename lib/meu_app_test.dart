double calcularDesconto(double valor, double desconto, bool percentual) {
  if (valor == 0) {
    return throw ArgumentError('O valor do produto não pode ser zero');
  }
  if (desconto == 0) {
    return throw ArgumentError('O valor do desconto não pode ser zero');
  }
  if (percentual) {
    return valor - ((valor * desconto) / 100);
  } else {
    return valor - desconto;
  }
}

String convertUpperCase(String texto) => texto.toUpperCase();

double retornaNum(double num) => num;
