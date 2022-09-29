import 'package:flutter/material.dart';
import 'package:preference_app/providers/theme_provider.dart';
import 'package:preference_app/widgets/side_menu.dart';
import 'package:provider/provider.dart';

import '../shae_preferences/preferences.dart';


class SettingsScreen extends StatefulWidget {

  static const String routerName = 'Settings';
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  //bool isDarkMode = false;
  //int gender = 1;
  //String name = 'Pedro';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      
      drawer: const SideMenu(),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Ajustes', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),),

              const Divider(),
              SwitchListTile.adaptive(
                value: Preferences.isDarkMode, 
                title: const Text('DarkMode'),
                onChanged: (value){
                  Preferences.isDarkMode = value;
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

                  value
                   ? themeProvider.setDarkMode() 
                   : themeProvider.setLightMode();
                  setState(() {});
                }
                
              ),

              const Divider(),
              RadioListTile<int>(
                title: const Text('Masculino'),
                value: 1, 
                groupValue: Preferences.gender, 
                onChanged: (value){
                  Preferences.gender = value ?? 1;
                  setState(() {
                    
                  });
                }
              ),

              const Divider(),
              RadioListTile(
                title: const Text('Femenino'),
                value: 2, 
                groupValue: Preferences.gender, 
                onChanged: (value){
                  Preferences.gender = value ?? 2;
                  setState(() {
                    
                  });
                }
              ),

              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value){
                    Preferences.name = value;
                    setState(() {
                      
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre del Usuario'
                  ),
                ),
              )



            ],
          ),
        ),
      )
    );
  }
}