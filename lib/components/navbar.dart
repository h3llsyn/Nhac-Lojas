import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarItem {
  final IconData icon;
  final String label;
  final int badgeCount;

  const NavBarItem({
    required this.icon,
    required this.label,
    this.badgeCount = 0,
  });
}

class FloatingNavBar extends StatelessWidget {
  final List<NavBarItem> items;
  final int selectedIndex;
  final bool isCollapsed;
  final ValueChanged<int> onItemTap;
  final VoidCallback? onCollapsedTap;

  const FloatingNavBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onItemTap,
    this.isCollapsed = false,
    this.onCollapsedTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isCollapsed) onCollapsedTap?.call();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        width: isCollapsed ? 75.w : (MediaQuery.of(context).size.width - 48.w),
        height: 75.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF5D201C).withValues(alpha: 0.1),
              blurRadius: 15.r,
              offset: Offset(0, 9.h),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState:
                isCollapsed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            alignment: Alignment.center,
            layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(key: bottomChildKey, top: 0, bottom: 0, child: bottomChild),
                  Positioned(key: topChildKey, child: topChild),
                ],
              );
            },
            firstChild: SizedBox(
              width: MediaQuery.of(context).size.width - 48.w,
              height: 75.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < items.length; i++)
                    _NavItem(
                      item: items[i],
                      isSelected: selectedIndex == i,
                      onTap: () => onItemTap(i),
                    ),
                ],
              ),
            ),
            secondChild: SizedBox(
              width: 75.w,
              height: 75.h,
              child: Center(
                child: Icon(
                  items[selectedIndex].icon,
                  size: 28.sp,
                  color: const Color(0xFFFF6961),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final NavBarItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 20.w : 12.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFEBD9) : Colors.transparent,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            item.badgeCount > 0
                ? Badge(
                    label: Text(item.badgeCount.toString()),
                    backgroundColor: const Color(0xFFFF6961),
                    child: Icon(
                      item.icon,
                      size: 28.sp,
                      color: isSelected
                          ? const Color(0xFFFF6961)
                          : const Color(0xFFA0A0A0),
                    ),
                  )
                : Icon(
                    item.icon,
                    size: 28.sp,
                    color: isSelected
                        ? const Color(0xFFFF6961)
                        : const Color(0xFFA0A0A0),
                  ),
            AnimatedSize(
              duration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
              child: SizedBox(
                width: isSelected ? null : 0,
                child: isSelected
                    ? Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          item.label,
                          style: TextStyle(
                            color: const Color(0xFFFF6961),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}