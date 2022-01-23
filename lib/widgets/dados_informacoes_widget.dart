import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste02_sds_escribo/models/cobras_escadas.dart';

import 'dado_widget.dart';

class DadosInformacoes extends StatelessWidget {
  const DadosInformacoes({
    Key? key,
    required this.vDado1,
    required this.cobrasEscadas,
    required this.vDado2,
    required this.escadas,
    required this.cobras,
  }) : super(key: key);

  final int vDado1;
  final CobrasEscadas cobrasEscadas;
  final int vDado2;
  final Map<String, List<Object>> escadas;
  final Map<String, List<Object>> cobras;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Dado(vDado1: vDado1),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              cobrasEscadas.resumo(vDado1, vDado2, escadas, cobras),
              style: GoogleFonts.wendyOne(),
              textAlign: TextAlign.center,
            )),
        Dado(vDado1: vDado2),
      ],
    );
  }
}
