import 'package:flutter/material.dart';
import 'package:preference_app/screens/screens.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(

        padding: EdgeInsets.zero,

        children: [
          const _DraweHeader(),

          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Home'),
            onTap: (){
              Navigator.pushNamed(context, HomeScreen.routerName);

            },
          ),

          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('People'),
            onTap: (){

            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: (){
              Navigator.pushNamed(context, SettingsScreen.routerName);
            },
          )
        ],
      ),

    );
  }
}

class _DraweHeader extends StatelessWidget {
  const _DraweHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.jpg'),
          fit: BoxFit.cover,
          
        )
      )
    );
  }
}