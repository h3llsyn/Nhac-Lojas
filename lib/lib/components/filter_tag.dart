import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterTag extends StatelessWidget {
  final String filtro;
  final int? quantidade;
  final bool isSelected;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? selectedBackgroundColor;
  final Color? selectedTextColor;

  const FilterTag({
    required this.filtro,
    this.quantidade,
    this.isSelected = false,
    this.backgroundColor,
    this.textColor,
    this.selectedBackgroundColor,
    this.selectedTextColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final primaryAppColor = Theme.of(context).colorScheme.primary;

    final effectiveBgColor = isSelected
        ? (selectedBackgroundColor ?? primaryAppColor)
        : (backgroundColor ?? Colors.white);

    final effectiveTextColor = isSelected
        ? (selectedTextColor ?? Colors.white)
        : (textColor ?? primaryAppColor);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: effectiveBgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            filtro,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: effectiveTextColor,
            ),
          ),
          if (quantidade != null)
            Text(
              ' · $quantidade',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: effectiveTextColor,
              ),
            ),
        ],
      ),
    );
  }
}