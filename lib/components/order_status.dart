import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Enum com todos os status em ordem sequencial
enum StatusPedido {
  recebido,
  emPreparo,
  pronto,
  aCaminho,
  entregue,
}

class OrderStatus extends StatelessWidget {
  final StatusPedido statusAtual;
  final Map<StatusPedido, String>? horarios; // Ex: {StatusPedido.recebido: '12:30'}

  const OrderStatus({
    super.key,
    required this.statusAtual,
    this.horarios,
  });

  // Lista fixa com os textos padrão de cada etapa
  static const List<_StepData> _etapasPadrao = [
    _StepData(
      status: StatusPedido.recebido,
      titulo: 'Pedido recebido',
      subtitulo: 'Recebido com sucesso',
    ),
    _StepData(
      status: StatusPedido.emPreparo,
      titulo: 'Em preparo',
      subtitulo: 'Estamos preparando seu pedido',
    ),
    _StepData(
      status: StatusPedido.pronto,
      titulo: 'Pronto',
      subtitulo: 'Aguardando retirada/entrega',
    ),
    _StepData(
      status: StatusPedido.aCaminho,
      titulo: 'A caminho',
      subtitulo: 'Saiu para entrega',
    ),
    _StepData(
      status: StatusPedido.entregue,
      titulo: 'Entregue',
      subtitulo: 'Pedido entregue ao cliente',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final int indexAtual = statusAtual.index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_etapasPadrao.length, (index) {
        final etapa = _etapasPadrao[index];
        final bool isCompleted = index < indexAtual;
        final bool isCurrent = index == indexAtual;
        final bool isLast = index == _etapasPadrao.length - 1;
        final String? horario = horarios?[etapa.status];

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Coluna com o ícone e a linha vertical
              SizedBox(
                width: 36.w,
                child: Column(
                  children: [
                    _buildStatusIcon(isCompleted: isCompleted, isCurrent: isCurrent),
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 2.w,
                          color: isCompleted
                              ? const Color(0xFF2EA970)
                              : const Color(0xFFF3E5D8),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              // Textos e Horários
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              etapa.titulo,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                                color: isCompleted || isCurrent
                                    ? const Color(0xFF5D201C)
                                    : const Color(0xFFC7B19E),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              etapa.subtitulo,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: isCompleted || isCurrent
                                    ? const Color(0xFF8D7B75)
                                    : const Color(0xFFC7B19E),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (horario != null)
                        Text(
                          horario,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildStatusIcon({required bool isCompleted, required bool isCurrent}) {
    if (isCompleted) {
      return Container(
        width: 32.w,
        height: 32.h,
        decoration: const BoxDecoration(
          color: Color(0xFF2EA970),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.check, size: 18.sp, color: Colors.white),
      );
    } else if (isCurrent) {
      return Container(
        width: 32.w,
        height: 32.h,
        decoration: BoxDecoration(
          color: const Color(0xFFFF8A80).withValues(alpha: 0.3),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: 24.w,
            height: 24.h,
            decoration: const BoxDecoration(
              color: Color(0xFFFF5252),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: 6.w,
                height: 6.h,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: 32.w,
        height: 32.h,
        decoration: const BoxDecoration(
          color: Color(0xFFFFF3E0),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: 6.w,
            height: 6.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFD3C5B7), width: 1.5.w),
            ),
          ),
        ),
      );
    }
  }
}

class _StepData {
  final StatusPedido status;
  final String titulo;
  final String subtitulo;

  const _StepData({
    required this.status,
    required this.titulo,
    required this.subtitulo,
  });
}