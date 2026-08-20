import 'package:flutter/material.dart';

class ItemFormaPagamento extends StatefulWidget {
  final IconData icon;
  final String metodo;
  final bool ativoInicial;

  const ItemFormaPagamento({
    required this.icon,
    required this.metodo,
    this.ativoInicial = true,
    super.key,
  });

  @override
  State<ItemFormaPagamento> createState() => _ItemFormaPagamentoState();
}

class _ItemFormaPagamentoState extends State<ItemFormaPagamento> {
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
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 242, 230),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(widget.icon, size: 20),
          ),
          Text(
            widget.metodo,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
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
