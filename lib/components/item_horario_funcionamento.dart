import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dia na esquerda
          SizedBox(
            width: 50.w,
            child: Text(
              widget.diaSemana,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: const Color(0xFF3D1308),
              ),
            ),
          ),

          // Horário fixo no meio
          Text(
            widget.horario,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: ativo ? const Color(0xFF3D1308) : Colors.grey,
            ),
          ),

          // Switch de liga/desliga na direita
          Transform.scale(
            scale: 0.85,
            child: Switch(
              value: ativo,
              activeThumbColor: Colors.white,
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