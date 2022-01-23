import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste02_sds_escribo/models/player_model.dart';
import 'package:teste02_sds_escribo/screens/home_screen/home_screen.dart';

class Grid extends StatelessWidget {
  const Grid({
    Key? key,
    required this.escadas,
    required this.cobras,
    required this.player1,
    required this.player2,
  }) : super(key: key);

  final Map<String, List<Object>> escadas;
  final Map<String, List<Object>> cobras;
  final Player player1;
  final Player player2;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 100,
        reverse: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10, mainAxisSpacing: 0, crossAxisSpacing: 0),
        itemBuilder: (BuildContext context, int index) {
          return Card(
              color: setColor(index, escadas, cobras),
              child: Stack(
                children: [
                  if (escadas['origem']!.contains(index + 1))
                    Image.asset("assets/images/stair.png"),
                  if (cobras['origem']!.contains(index + 1))
                    Image.asset("assets/images/snake.png"),
                  Center(
                    child: Text((1 + index).toString(),
                        style: GoogleFonts.wendyOne(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                  if (player1.estagio == index + 1 &&
                      player1.estagio != player2.estagio)
                    Image.asset("assets/images/p1.png"),
                  if (player2.estagio == index + 1 &&
                      player1.estagio != player2.estagio)
                    Image.asset("assets/images/p2.png"),
                  if (player1.estagio != 0 &&
                      player1.estagio == index + 1 &&
                      player2.estagio == index + 1 &&
                      player1.estagio == player2.estagio)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            height: 13,
                            width: 13,
                            child: Image.asset("assets/images/p1.png")),
                        SizedBox(
                            height: 13,
                            width: 13,
                            child: Image.asset("assets/images/p2.png")),
                      ],
                    ),
                ],
              ));
        });
  }
}
