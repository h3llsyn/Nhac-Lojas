import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchContainer extends StatelessWidget {
  final String label;

  const SearchContainer({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5D201C).withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: const Offset(0.0, 4.0),
          ),
        ],
      ),
      child: TextField(
        style: TextStyle(
          fontSize: 14.sp,
          color: const Color(0xFF5D201C),
        ),
        decoration: InputDecoration(
          isDense: true, // Reduz a altura interna padrão do TextField
          hintText: label,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 14.sp,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h, // Ajuste este valor para controlar a altura do container
          ),
        ),
      ),
    );
  }
}