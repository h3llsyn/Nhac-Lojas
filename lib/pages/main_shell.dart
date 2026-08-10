import 'package:flutter/material.dart';
import 'package:nhac_lojas/components/navbar.dart';
import 'package:nhac_lojas/components/scroll_top_button.dart';
import 'package:nhac_lojas/pages/chat_page.dart';
import 'package:nhac_lojas/pages/home_page.dart';
import 'package:nhac_lojas/pages/order_page.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;
  bool _isScrolledDown = false;
  final _scrollController = ScrollController();

  final _items = const [
    NavBarItem(icon: Icons.house_outlined, label: 'Início'),
    NavBarItem(icon: Icons.receipt_long_outlined, label: 'Pedidos'),
    NavBarItem(icon: Icons.chat_outlined, label: 'Chat'),
    NavBarItem(icon: Icons.person_outline, label: 'Perfil'),
  ];

  final List<Widget> _pages = const [
    HomePage(),
    OrderPage(),
    ChatPage(),
    Center(child: Text('Perfil')),
  ];

  void _onNavTap(int index) {
    setState(() => _selectedIndex = index);
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification &&
              notification.metrics.axis == Axis.vertical) {
            if (notification.metrics.pixels > 150 && !_isScrolledDown) {
              setState(() => _isScrolledDown = true);
            } else if (notification.metrics.pixels <= 150 && _isScrolledDown) {
              setState(() => _isScrolledDown = false);
            }
          }
          return false;
        },
        child: PrimaryScrollController(
          controller: _scrollController,
          child: Stack(
            children: [
              IndexedStack(
                index: _selectedIndex,
                children: _pages,
              ),
              ScrollToTopButton(
                visible: _isScrolledDown,
                onTap: _scrollToTop,
              ),
              Positioned(
                left: 24,
                right: 24,
                bottom: 20,
                child: FloatingNavBar(
                  items: _items,
                  selectedIndex: _selectedIndex,
                  onItemTap: _onNavTap,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}