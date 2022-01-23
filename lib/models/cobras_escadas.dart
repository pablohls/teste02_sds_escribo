import 'package:flutter/material.dart';
import 'package:teste02_sds_escribo/models/player_model.dart';

class CobrasEscadas {
  final Player player1;
  final Player player2;
  final List<int> valoresOrigemEscada = [
    2,
    7,
    8,
    15,
    21,
    28,
    36,
    51,
    78,
    87,
  ];
  final List<int> valoresDestinoEscada = [
    38,
    14,
    31,
    26,
    42,
    84,
    44,
    67,
    98,
    94
  ];
  final List<int> valoresOrigemCobras = [
    16,
    46,
    49,
    62,
    64,
    74,
    89,
    92,
    95,
    99
  ];
  final List<int> valoresDestinoCobras = [
    6,
    25,
    11,
    19,
    60,
    53,
    68,
    88,
    75,
    80
  ];
  List<Color> coresEscadas = [
    const Color.fromRGBO(247, 37, 133, 1),
    const Color.fromRGBO(181, 23, 158, 1),
    const Color.fromRGBO(114, 9, 183, 1),
    const Color.fromRGBO(86, 11, 173, 1),
    const Color.fromRGBO(72, 12, 168, 1),
    const Color.fromRGBO(58, 12, 163, 1),
    const Color.fromRGBO(63, 55, 201, 1),
    const Color.fromRGBO(67, 97, 238, 1),
    const Color.fromRGBO(72, 149, 239, 1),
    const Color.fromRGBO(76, 201, 240, 1),
  ];
  List<Color> coresCobras = [
    const Color.fromRGBO(255, 255, 63, 1),
    const Color.fromRGBO(238, 239, 32, 1),
    const Color.fromRGBO(221, 223, 0, 1),
    const Color.fromRGBO(212, 215, 0, 1),
    const Color.fromRGBO(191, 210, 0, 1),
    const Color.fromRGBO(170, 204, 0, 1),
    const Color.fromRGBO(128, 185, 24, 1),
    const Color.fromRGBO(85, 166, 48, 1),
    const Color.fromRGBO(43, 147, 72, 1),
    const Color.fromRGBO(0, 127, 95, 1),
  ];

  CobrasEscadas(this.player1, this.player2);

  void jogar(int dado1, int dado2, var escadas, var cobras) {
    // var escadas = {
    //   'origem': valoresOrigemEscada,
    //   'destino': valoresDestinoEscada
    // };
    // var cobras = {
    //   'origem': valoresOrigemCobras,
    //   'destino': valoresDestinoCobras
    // };

    int resultadoJogada = dado1 + dado2;

    if (player1.vez == true) {
      player1.estagioAnterior = player1.estagio;

      if (player1.estagio < 100) {
        if (player1.estagio + resultadoJogada < 100) {
          player1.estagio += resultadoJogada;
        } else {
          player1.estagio = 100 - ((player1.estagio + resultadoJogada) - 100);
        }
      }

      for (int i = 0; i <= 9; i++) {
        if (player1.estagio == escadas['origem']?[i]) {
          player1.estagio = escadas['destino']![i];
        } else if (player1.estagio == cobras['origem']?[i]) {
          player1.estagio = cobras['destino']![i];
        }
      }
    } else {
      player2.estagioAnterior = player2.estagio;

      if (player2.estagio < 100) {
        if (player2.estagio + resultadoJogada < 100) {
          player2.estagio += resultadoJogada;
        } else {
          player2.estagio = 100 - ((player2.estagio + resultadoJogada) - 100);
        }
      }

      for (int i = 0; i <= 9; i++) {
        if (player2.estagio == escadas['origem']?[i]) {
          player2.estagio = escadas['destino']![i];
        } else if (player2.estagio == cobras['origem']?[i]) {
          player2.estagio = cobras['destino']![i];
        }
      }
    }
    //resumo();
    alternarVez();
  }

  void alternarVez() {
    player1.vez = !player1.vez;
    player2.vez = !player2.vez;
  }

  String resumo(int dado1, int dado2, Map<String, List<Object>> escadas,
      Map<String, List<Object>> cobras) {
    int resultadoJogada = dado1 + dado2;
    String instrucao = "";

    if (player1.estagio <= 0) {
      instrucao = "Vamos começar, o Jogador 1 começa! Clique em Rolar Dados!";
    }

    if (player1.estagio > 0) {
      instrucao =
          "Parabéns o Jogador ${(player1.vez) ? player2.nome : player1.nome} tirou: ${dado1 + dado2}, vai da casa ${(player1.vez) ? player2.estagioAnterior : player1.estagioAnterior} para casa ${(player1.vez) ? player2.estagio : player1.estagio}.";
    }

    if (escadas['origem']!.contains(player1.estagioAnterior + dado1 + dado2) &&
        player1.vez == false) {
      instrucao =
          "Parabéns o Jogador ${(player1.vez) ? player2.nome : player1.nome} tirou: ${dado1 + dado2}, vai da casa ${(player1.vez) ? player2.estagioAnterior : player1.estagioAnterior} para casa ${(player1.vez) ? player2.estagioAnterior + dado1 + dado2 : player1.estagioAnterior + dado1 + dado2}, Mas espere! Ele encontra uma escada, siga para a casa ${(player1.vez) ? player2.estagio : player1.estagio}.";
    }

    if (escadas['origem']!.contains(player2.estagioAnterior + dado1 + dado2) &&
        player2.vez == false) {
      instrucao =
          "Parabéns o Jogador ${(player1.vez) ? player2.nome : player1.nome} tirou: ${dado1 + dado2}, vai da casa ${(player1.vez) ? player2.estagioAnterior : player1.estagioAnterior} para casa ${(player1.vez) ? player2.estagioAnterior + dado1 + dado2 : player1.estagioAnterior + dado1 + dado2}, Mas espere! Ele encontra uma escada, siga para a casa ${(player1.vez) ? player2.estagio : player1.estagio}.";
    }

    if (player1.estagio + resultadoJogada < 100 &&
        cobras['origem']!.contains(player1.estagioAnterior + dado1 + dado2) &&
        player1.vez == false) {
      instrucao =
          "Parabéns o Jogador ${(player1.vez) ? player2.nome : player1.nome} tirou: ${dado1 + dado2}, vai da casa ${(player1.vez) ? player2.estagioAnterior : player1.estagioAnterior} para casa ${(player1.vez) ? player2.estagioAnterior + dado1 + dado2 : player1.estagioAnterior + dado1 + dado2}, Mas espere! Ele encontra uma cobra, volte para a casa ${(player1.vez) ? player2.estagio : player1.estagio}.";
    }

    if (cobras['origem']!.contains(player2.estagioAnterior + dado1 + dado2) &&
        player2.vez == false) {
      instrucao =
          "Parabéns o Jogador ${(player1.vez) ? player2.nome : player1.nome} tirou: ${dado1 + dado2}, vai da casa ${(player1.vez) ? player2.estagioAnterior : player1.estagioAnterior} para casa ${(player1.vez) ? player2.estagioAnterior + dado1 + dado2 : player1.estagioAnterior + dado1 + dado2}, Mas espere! Ele encontra uma cobra, volta para a casa ${(player1.vez) ? player2.estagio : player1.estagio}";
    }

    if (player1.estagio == 100 || player2.estagio == 100) {
      instrucao =
          "Parabéns o Jogador ${(player1.estagio == 100) ? player1.nome : player2.nome} venceu o Jogo.";
    }

    return instrucao;
  }

  reiniciarJogo(Player player1, Player player2) {
    player1.estagio = 0;
    player2.estagio = 0;
    player1.vez = true;
    player2.vez = false;
  }
}
