import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/order_status.dart';

class UpdateOrderStatus extends StatelessWidget {
  const UpdateOrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const BackArrow(),
                    SizedBox(width: 16.w),
                    Text(
                      'Atualizar status',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: const ContainerNhac(
                    icon: Icons.receipt,
                    corIcone: Colors.redAccent,
                    informacao: 'Maria Silva',
                    codigo: 1250,
                    quantidadeItens: 2,
                    preco: 49.90,
                    situacao: 'Em preparo',
                    exibirCirculoSituacao: false,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'ANDAMENTO DO PEDIDO',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 12.h),
                const OrderStatus(
                  statusAtual: StatusPedido.emPreparo,
                  horarios: {
                    StatusPedido.recebido: '12:30',
                    StatusPedido.emPreparo: '12:32',
                  },
                ),
                SizedBox(height: 48.h),
                ButtonNhac(
                  texto: 'Salvar status',
                  onTap: () => context.pop('/order-details'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}