import 'package:flutter/material.dart';
import 'package:preference_app/views/view.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _navigator(String routeName) {
      Navigator.pushReplacementNamed(context, routeName);
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home_outlined),
            onTap: () {
              _navigator(HomeView.routerName);
            },
          ),
          ListTile(
            title: const Text('People'),
            leading: const Icon(Icons.people_outline),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Settings'),
            leading: const Icon(Icons.settings_outlined),
            onTap: () {
              _navigator(SettingsView.routerName);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
