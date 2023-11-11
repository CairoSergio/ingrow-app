import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ingrowapp/screens/auth/login.dart';
import 'package:ingrowapp/screens/auth/payment.dart';
import 'package:ingrowapp/screens/auth/signup.dart';
import 'package:ingrowapp/screens/auth/subscriptionplans.dart';
import 'package:ingrowapp/screens/root/rootWrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  static const int _primaryValue = 0xFF006FFD;

  static const MaterialColor primaryblue = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFE1ECFF),
      100: Color(0xFFB3D0FF),
      200: Color(0xFF82B5FF),
      300: Color(0xFF4F99FF),
      400: Color(0xFF286CFF),
      500: Color(_primaryValue),
      600: Color(0xFF0059D3),
      700: Color(0xFF004FB0),
      800: Color(0xFF00448F),
      900: Color(0xFF00361F),
    },
  );

  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const Signup(),
      ),
      GoRoute(
        path: '/subscription',
        builder: (context, state) => const SubscriptionPlans(),
      ),
      GoRoute(
        path: '/payment/:price',
        builder: (context, state) => Payment(price: state.pathParameters),
      ),
      GoRoute(
        path: '/root',
        builder: (context, state) => const RootWrapper(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'inGrow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryblue),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
