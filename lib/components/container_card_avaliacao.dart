import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerCardAvaliacao extends StatelessWidget {
  final String letraAvatar;
  final String nomeCliente;
  final String horario;
  final int quantidadeEstrelas;
  final String comentario;
  final VoidCallback? onResponderPressed;

  const ContainerCardAvaliacao({
    required this.letraAvatar,
    required this.nomeCliente,
    required this.horario,
    required this.quantidadeEstrelas,
    required this.comentario,
    this.onResponderPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Círculo com a inicial do cliente
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 242, 230),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                letraAvatar,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: const Color.fromARGB(255, 93, 32, 28),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          
          // Conteúdo da avaliação
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Linha superior: Nome e Horário
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nomeCliente,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: const Color.fromARGB(255, 93, 32, 28),
                      ),
                    ),
                    Text(
                      horario,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),

                // Estrelas
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < quantidadeEstrelas
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      color: Colors.amber,
                      size: 16.sp,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),

                // Comentário
                Text(
                  comentario,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 12.h),

                // Botão Responder
                InkWell(
                  onTap: onResponderPressed,
                  borderRadius: BorderRadius.circular(16.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 242, 230),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Text(
                      'Responder',
                      style: TextStyle(
                        color: const Color(0xFF5D201C),
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}