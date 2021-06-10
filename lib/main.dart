import 'package:flutter/material.dart';

import 'app/app.dart';

// Programação assíncrona serve para executar instruções de forma
// dessincronizada, evitando pausa da aplicação quando se depara com
// um código lento.
//
// Future é uma função que retornará um valor futuro, é assíncrona
// A palavra-chave async serve para indicar que dentro do bloco de instruções
// existem funções assíncronas, sendo possível sincroniza-las se preciso
// e isso é feito através da palavra-chave await antes da função assíncrona
// que deve ser sincronizada, indicando que as instruções posteriores devem
// esperar a conclusão de sua execução.

void main() async {
  // o código da aplicação flutter foi comentado
  // apenas para as atividades dessa aula
  //runApp(App());

  print('Buscando usuário');

  await fetch();

  printUser();

  print('Dados do usuário buscados com sucesso!');
}

Future fetch() {
  return Future.delayed(Duration(seconds: 10));
}

getUser() {
  return {
    'nome': 'teste',
    'idade': '19',
    'sexo': 'M',
  };
}

printUser() {
  var user = getUser();

  print('Nome: ' + user['nome']);
  print('Idade: ' + user['idade']);
  print('Sexo: ' + user['sexo']);
}
