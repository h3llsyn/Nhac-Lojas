import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/pages/auth/email_loja.dart';
import 'package:nhac_lojas/pages/auth/link_recuperacao_senha.dart';
import 'package:nhac_lojas/pages/auth/nova_senha.dart';
import 'package:nhac_lojas/pages/auth/recuperar_senha.dart';
import 'package:nhac_lojas/pages/bem-vindo.dart';
import 'package:nhac_lojas/pages/chat_open.dart';
import 'package:nhac_lojas/pages/chat_page.dart';
import 'package:nhac_lojas/pages/home_page.dart';
import 'package:nhac_lojas/pages/main_shell.dart';
import 'package:nhac_lojas/pages/order_details_page.dart';
import 'package:nhac_lojas/pages/order_page.dart';
import 'package:nhac_lojas/pages/update_order_status.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/bem-vindo',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/orders',
          builder: (context, state) => const OrderPage(),
        ),
        GoRoute(
          path: '/chat',
          builder: (context, state) => const ChatPage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const Scaffold(
            body: Center(child: Text('Perfil')),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/bem-vindo',
      builder: (context, state) => const BemVindo(),
    ),
    GoRoute(
      path: '/email',
      builder: (context, state) => const EmailLoja(),
    ),
    GoRoute(
      path: '/recuperar-senha',
      builder: (context, state) => const RecuperarSenha(),
    ),
    GoRoute(
      path: '/link-recuperacao',
      builder: (context, state) => const LinkRecuperacaoSenha(),
    ),
    GoRoute(
      path: '/nova-senha',
      builder: (context, state) => const NovaSenha(),
    ),
    GoRoute(
      path: '/order-details',
      builder: (context, state) => const OrderDetailsPage(),
    ),
    GoRoute(
      path: '/update-status',
      builder: (context, state) => const UpdateOrderStatus(),
    ),
    GoRoute(
      path: '/chat-open',
      builder: (context, state) => const ChatOpen(),
    ),
  ],
);