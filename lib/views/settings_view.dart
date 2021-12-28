import 'package:flutter/material.dart';
import 'package:preference_app/providers/theme_provider.dart';
import 'package:preference_app/shared_preferences/preferences.dart';
import 'package:preference_app/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  static const String routerName = 'Settings';

  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(SettingsView.routerName),
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                value: Preferences.isDarkMode,
                title: const Text('DarkMode'),
                onChanged: (value) {
                  setState(() {
                    Preferences.isDarkMode = value;
                    final themeProvider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    value
                        ? themeProvider.setDarkMode()
                        : themeProvider.setLightMode();
                  });
                },
              ),
              const Divider(),
              RadioListTile<int>(
                value: 1,
                groupValue: Preferences.gender,
                title: const Text('Masculino'),
                onChanged: (value) {
                  setState(() {
                    Preferences.gender = value ?? 1;
                  });
                },
              ),
              const Divider(),
              RadioListTile<int>(
                value: 2,
                groupValue: Preferences.gender,
                title: const Text('Femenino'),
                onChanged: (value) {
                  setState(() {
                    Preferences.gender = value ?? 2;
                  });
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value) {
                    setState(() {
                      Preferences.name = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de usuario',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
