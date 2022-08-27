import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/data/model/user_model.dart';
import 'package:provider_example/presentation/change_notifier/change_notifier_controller.dart';
import 'presentation/change_notifier/change_notifier_page.dart';
import 'presentation/home/home_page.dart';
import 'presentation/provider/provider_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            return UserModel(
              name: 'Dart',
              imgAvatar:
                  'https://raw.githubusercontent.com/kevmoo/dart_side/master/Dash%20Dart%20PNG%20%20-%20white.png',
              birthDate: '10/10/2011',
            );
          },
        ),
        ChangeNotifierProvider(create: (_) {
          return ChangeNotifierController();
        }),
      ],
      child: MaterialApp(
        routes: {
          '/provider': (_) => const ProviderPage(),
          '/change_notifier': (_) => const ChangeNotifierPage()
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
