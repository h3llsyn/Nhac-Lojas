import 'package:flutter/material.dart';

class ItemHorarioFuncionamento extends StatefulWidget {
  final String diaSemana;
  final String horario;
  final bool ativoInicial;

  const ItemHorarioFuncionamento({
    super.key,
    required this.diaSemana,
    required this.horario,
    this.ativoInicial = true,
  });

  @override
  State<ItemHorarioFuncionamento> createState() =>
      _ItemHorarioFuncionamentoState();
}

class _ItemHorarioFuncionamentoState extends State<ItemHorarioFuncionamento> {
  late bool ativo;

  @override
  void initState() {
    super.initState();
    ativo = widget.ativoInicial;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dia na esquerda
          SizedBox(
            width: 50,
            child: Text(
              widget.diaSemana,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF3D1308),
              ),
            ),
          ),

          // Horário fixo no meio
          Text(
            widget.horario,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: ativo ? const Color(0xFF3D1308) : Colors.grey,
            ),
          ),

          // Switch de liga/desliga na direita
          Transform.scale(
            scale: 0.85,
            child: Switch(
              value: ativo,
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFFFF6961),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey.shade300,
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              onChanged: (valor) => setState(() => ativo = valor),
            ),
          ),
        ],
      ),
    );
  }
}