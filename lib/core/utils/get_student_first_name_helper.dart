 String primeiroNomeDoAluno(String texto) {
    int indiceEspaco = texto.indexOf(' ');

    if (indiceEspaco == -1) {
      return texto;
    }

    return texto.substring(0, indiceEspaco);
  }