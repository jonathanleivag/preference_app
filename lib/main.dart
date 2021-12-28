import 'package:flutter/material.dart';
import 'package:preference_app/providers/theme_provider.dart';
import 'package:preference_app/shared_preferences/preferences.dart';
import 'package:preference_app/views/view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(
          isDarkMode: Preferences.isDarkMode,
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.routerName,
      routes: {
        HomeView.routerName: (_) => const HomeView(),
        SettingsView.routerName: (_) => const SettingsView()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
