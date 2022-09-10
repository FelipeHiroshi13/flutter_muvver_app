import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:muvver/views/home/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:muvver/views/payment/payment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muvver',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      onGenerateRoute: (settings){
        if(settings.name == '/home'){
          return MaterialPageRoute(
              builder: (context) => HomePage(), settings: settings
          );
        }
        if(settings.name == '/payment'){
          return MaterialPageRoute(
              builder: (context) => Payment(), settings: settings
          );
        }
      },
    );
  }
}
