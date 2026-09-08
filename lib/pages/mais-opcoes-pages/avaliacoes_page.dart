import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nhac_lojas/components/back_arrow.dart';
import 'package:nhac_lojas/components/button_nhac.dart';
import 'package:nhac_lojas/components/container_nhac.dart';
import 'package:nhac_lojas/components/filter_tag.dart';

class AvaliacoesPage extends StatelessWidget {
  const AvaliacoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 46.h, 20.w, 110.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const BackArrow(),
                  SizedBox(width: 12.w),
                  Text(
                    'Avaliações',
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
                child: Column(
                  children: [
                    ContainerNhac(
                      informacao: 'Muito dificil depois faço'
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const FilterTag(
                      filtro: 'Todas',
                      quantidade: 127,
                      isSelected: true,
                    ),
                    SizedBox(width: 8.w),
                    const FilterTag(
                      filtro: 'Não respondidas',
                      quantidade: 5,
                    ),
                    SizedBox(width: 8.w),
                    const FilterTag(
                      filtro: 'Respondidas',
                      quantidade: 122,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    ContainerNhac(
                      informacao: 'Muito dificil depois faço'
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}