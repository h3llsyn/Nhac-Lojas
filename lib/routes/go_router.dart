import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nhac_lojas/pages/auth/cadastro/confirmar_email_page.dart';
import 'package:nhac_lojas/pages/auth/cadastro/criar_conta_page.dart';
import 'package:nhac_lojas/pages/auth/cadastro/dados_basicos_page.dart';
import 'package:nhac_lojas/pages/auth/cadastro/dados_entrega_page.dart';
import 'package:nhac_lojas/pages/auth/cadastro/endereco_loja_page.dart';
import 'package:nhac_lojas/pages/auth/cadastro/formas_pagamento_page.dart';
import 'package:nhac_lojas/pages/auth/cadastro/horario_funcionamento_page.dart';
import 'package:nhac_lojas/pages/auth/cadastro/loja_cadastrada_page.dart';
import 'package:nhac_lojas/pages/auth/cadastro/revisar_dados_page.dart';
import 'package:nhac_lojas/pages/auth/login_loja.dart';
import 'package:nhac_lojas/pages/auth/link_recuperacao_senha.dart';
import 'package:nhac_lojas/pages/auth/nova_senha.dart';
import 'package:nhac_lojas/pages/auth/recuperar_senha.dart';
import 'package:nhac_lojas/pages/bem-vindo.dart';
import 'package:nhac_lojas/pages/mais-opcoes-pages/cadastrar_produtos.dart';
import 'package:nhac_lojas/pages/mais-opcoes-pages/cardapio_vazio_page.dart';
import 'package:nhac_lojas/pages/mais-opcoes-pages/editar_info_loja.dart';
import 'package:nhac_lojas/pages/mais-opcoes-pages/informacao_loja.dart';
import 'package:nhac_lojas/pages/chat_open.dart';
import 'package:nhac_lojas/pages/chat_page.dart';
import 'package:nhac_lojas/pages/home_page.dart';
import 'package:nhac_lojas/pages/main_shell.dart';
import 'package:nhac_lojas/pages/more_page.dart';
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
          path: '/mais',
          builder: (context, state) => const MorePage(),
        ),
      ],
    ),
    GoRoute(
      path: '/bem-vindo',
      builder: (context, state) => const BemVindo(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginLoja(),
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
      path: '/criar-conta',
      builder: (context, state) => const CriarContaPage(),
    ),
    GoRoute(
      path: '/confirmar-email',
      builder: (context, state) => const ConfirmarEmailPage(),
    ),
    GoRoute(
      path: '/dados-basicos',
      builder: (context, state) => const DadosBasicosPage(),
    ),
    GoRoute(
      path: '/endereco-loja',
      builder: (context, state) => const EnderecoLojaPage(),
    ),
    GoRoute(
      path: '/dados-entrega',
      builder: (context, state) => const DadosEntregaPage(),
    ),
    GoRoute(
      path: '/horario-funcionamento',
      builder: (context, state) => const HorarioFuncionamentoPage(),
    ),
    GoRoute(
      path: '/forma-pagamento',
      builder: (context, state) => const FormasPagamentoPage(),
    ),
    GoRoute(
      path: '/revisar-dados',
      builder: (context, state) => const RevisarDadosPage(),
    ),
    GoRoute(
      path: '/loja-cadastrada',
      builder: (context, state) => const LojaCadastradaPage(),
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
    GoRoute(
      path: '/informacao-loja',
      builder: (context, state) => const InformacaoLoja(),
    ),
    GoRoute(
      path: '/cardapio-vazio',
      builder: (context, state) => const CardapioVazioPage(),
    ),
    GoRoute(
      path: '/cadastrar-produtos',
      builder: (context, state) => const CadastrarProdutos(),
    ),
    GoRoute(
      path: '/editar-info-loja',
      builder: (context, state) => const EditarInfoLoja(),
    ),
  ],
);