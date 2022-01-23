import 'package:flutter/material.dart';
import 'package:teste02_sds_escribo/models/player_model.dart';
import 'package:teste02_sds_escribo/widgets/texto_jogador_widget.dart';

class JogadoresInfo extends StatelessWidget {
  const JogadoresInfo({
    Key? key,
    required this.player1,
    required this.player2,
  }) : super(key: key);

  final Player player1;
  final Player player2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextoJogador(
          player: player1,
        ),
        TextoJogador(
          player: player2,
        ),
      ],
    );
  }
}
