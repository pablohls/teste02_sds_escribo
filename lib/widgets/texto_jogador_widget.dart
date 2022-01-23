import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste02_sds_escribo/models/player_model.dart';

class TextoJogador extends StatelessWidget {
  const TextoJogador({
    Key? key,
    required this.player,
  }) : super(key: key);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: (player.vez) ? 10 : 0,
        color: (player.nome == "1") ? Colors.red : Colors.blue,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          if (player.vez == true)
            SizedBox(
              width: 40,
              child: Image.asset(
                'assets/images/p${player.nome}.png',
              ),
            ),
          Text('Jogador ${player.nome}',
              style: GoogleFonts.wendyOne(
                  fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(
            height: 2,
          ),
          Text('Estagio: ${player.estagio}',
              style: GoogleFonts.wendyOne(
                  fontWeight: FontWeight.bold, fontSize: 15)),
        ]),
      ),
    );
  }
}
