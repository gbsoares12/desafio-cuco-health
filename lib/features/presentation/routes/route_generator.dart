import 'package:desafio_cuco/features/presentation/controllers/bloc/user_bloc.dart';
import 'package:desafio_cuco/features/presentation/pages/home/home_page.dart';
import 'package:desafio_cuco/features/presentation/pages/user_list/list_users_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider<UserBloc>(
              create: (context) => sl<UserBloc>(), child: HomePage()),
        );
      case '/listUser':
        return MaterialPageRoute(
          builder: (context) => BlocProvider<UserBloc>(
              create: (context) => sl<UserBloc>(), child: ListUserPage()),
        );

      default:
        return _errorRoute();
    }
  }

  static manangerRoute() {}
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
