import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste02_sds_escribo/models/cobras_escadas.dart';
import 'package:teste02_sds_escribo/models/player_model.dart';
import 'package:teste02_sds_escribo/widgets/dados_informacoes_widget.dart';
import 'package:teste02_sds_escribo/widgets/grid_widget.dart';
import 'package:teste02_sds_escribo/widgets/jogadoresInfo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Player player1 = Player(nome: "1", estagio: 0, vez: true);
  Player player2 = Player(nome: "2", estagio: 0, vez: false);
  int vDado1 = 6;
  int vDado2 = 6;

  @override
  Widget build(BuildContext context) {
    CobrasEscadas cobrasEscadas = CobrasEscadas(player1, player2);
    var escadas = {
      'origem': cobrasEscadas.valoresOrigemEscada,
      'destino': cobrasEscadas.valoresDestinoEscada,
      'cores': cobrasEscadas.coresEscadas
    };
    var cobras = {
      'origem': cobrasEscadas.valoresOrigemCobras,
      'destino': cobrasEscadas.valoresDestinoCobras,
      'cores': cobrasEscadas.coresCobras
    };
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Seleção de Desenvolvedor de Software Escribo - Teste Técnico 2',
          style: TextStyle(fontSize: 12),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: JogadoresInfo(player1: player1, player2: player2),
              ),
              Expanded(
                flex: 3,
                child: DadosInformacoes(
                    vDado1: vDado1,
                    cobrasEscadas: cobrasEscadas,
                    vDado2: vDado2,
                    escadas: escadas,
                    cobras: cobras),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed:
                        (player1.estagio == 100 || player2.estagio == 100)
                            ? () {
                                setState(() {
                                  cobrasEscadas.reiniciarJogo(player1, player2);
                                });
                              }
                            : () {
                                setState(() {
                                  vDado1 = Random().nextInt(6) + 1;
                                  vDado2 = Random().nextInt(6) + 1;
                                  cobrasEscadas.jogar(
                                      vDado1, vDado2, escadas, cobras);
                                });
                              },
                    child: Text(
                      (player1.estagio == 100 || player2.estagio == 100)
                          ? "Reiniciar Jogo"
                          : 'Rolar Dados',
                      style: GoogleFonts.wendyOne(),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: (player1.vez) ? Colors.red : Colors.blue)),
              ),
              Expanded(
                flex: 10,
                child: Grid(
                    escadas: escadas,
                    cobras: cobras,
                    player1: player1,
                    player2: player2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color setColor(int index, var escadas, var cobras) {
  Color _color = Colors.white;

  if (escadas['origem']!.contains(index + 1)) {
    _color = escadas['cores'][escadas['origem']!.indexOf(index + 1)];
  }
  if (escadas['destino']!.contains(index + 1)) {
    _color = escadas['cores'][escadas['destino']!.indexOf(index + 1)];
  }

  if (cobras['origem']!.contains(index + 1)) {
    _color = cobras['cores'][cobras['origem']!.indexOf(index + 1)];
  }
  if (cobras['destino']!.contains(index + 1)) {
    _color = cobras['cores'][cobras['destino']!.indexOf(index + 1)];
  }

  return _color;
}
