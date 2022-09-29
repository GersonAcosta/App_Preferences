import 'package:flutter/material.dart';
import 'package:preference_app/providers/theme_provider.dart';
import 'package:preference_app/screens/home_screen.dart';
import 'package:preference_app/screens/settings_screen.dart';
import 'package:preference_app/shae_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ThemeProvider(isDarkMode: Preferences.isDarkMode)),
      ],
      child: const MyApp(),

    )
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName    : ( _ ) => const HomeScreen(),
        SettingsScreen.routerName: ( _ ) =>  const SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
     
    );
  }
}