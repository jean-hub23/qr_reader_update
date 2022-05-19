import 'package:flutter/material.dart';
import 'package:qr_reader/presentation/pages/pages.dart';
import 'package:qr_reader/theme/theme.dart';

class DrawerWidget extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  <Widget>[
          HeaderDrawer(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'home');
              // const HomePage();
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Historic'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'historic');
            },
            
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: (){
              Navigator.pushReplacementNamed(context, 'settings');
            },
          ),
        ],
      ),
    );
  }
}

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.jpg'),
          fit: BoxFit.cover,
        )
      ),
      child: Container(),
    );
  }
}