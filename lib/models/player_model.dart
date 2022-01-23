import 'package:flutter/material.dart';

class Player {
  final String nome;
  @required
  int estagio = 1;
  int estagioAnterior = 0;
  @required
  bool vez = false;
  Player({
    required this.nome,
    required this.estagio,
    required this.vez,
  });
}
