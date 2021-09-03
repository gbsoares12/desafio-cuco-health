// import 'package:desafio_cuco/features/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'features/presentation/routes/route_generator.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initUser();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Cuco Health',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: navigatorKey,
    );
  }
}
