import 'package:flutter/material.dart';
import 'package:preference_app/widgets/side_menu.dart';

import '../shae_preferences/preferences.dart';

class HomeScreen extends StatelessWidget {

  static const String routerName = 'Home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),

      drawer: const SideMenu(),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text('isDarkMode: ${Preferences.isDarkMode}'),
          const Divider(),
          Text('Genero: ${Preferences.gender}'),
          const Divider(),
          Text('Nombre de usuario: ${Preferences.name}'),
          const Divider()

        ],
      ),
    );
  }
}