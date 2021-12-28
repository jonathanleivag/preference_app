import 'package:flutter/material.dart';
import 'package:preference_app/shared_preferences/preferences.dart';
import 'package:preference_app/widgets/drawer_widget.dart';

class HomeView extends StatelessWidget {
  static const String routerName = 'Home';

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(routerName),
      ),
      drawer: const DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('IsDarkMode: ${Preferences.isDarkMode}'),
          const Divider(),
          Text('Genero: ${Preferences.gender == 1 ? 'masculino': 'femenino'}'),
          const Divider(),
          Text('Nombre de usuario: ${Preferences.name}'),
          const Divider(),
        ],
      ),
    );
  }
}
