import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/devices/preferences.dart';
import 'package:qr_reader/domain/providers/theme_provider.dart';
import 'package:qr_reader/presentation/pages/home/widgets/drawer.dart';
class SettingsPage extends StatefulWidget {

  static String routeName = 'SettingPage';

  const SettingsPage({ Key? key }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    ;
    return  Scaffold(
      drawer: DrawerWidget(), 
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body:Column(
        children: [
          Container(
            child: const Text('Ajustes', style: TextStyle(
              fontSize: 40
            ),),
          ),
          const Divider(),
          SwitchListTile.adaptive(
            title: const Text('Modo Oscuro'),
            value: Preferences.isDarkMode, 
            onChanged: (value){
              Preferences.isDarkMode = value;
              final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

              value 
              ? themeProvider.setDarkMode()
              : themeProvider.setLightMode();
              setState(() {});
            },
          ),

          const Divider(),
          RadioListTile<int>(
            value: 1, 
            groupValue: Preferences.gender, 
            title: Text('Masculino'),
            onChanged: (value){
              Preferences.gender = value ?? 1;
              setState(() {});
            }
          ),

          const Divider(),
          RadioListTile<int>(
            value: 2, 
            groupValue: Preferences.gender, 
            title: const Text('Femenino'),
            onChanged: (value){
              Preferences.gender = value?? 2;
              setState(() {});
            }
          ),
          
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:30),
            child: TextFormField(
              initialValue: Preferences.name,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre del usuario'
              ),
              onChanged: (value){
                Preferences.name=value;
                setState(() {});
              },
            ),
          )
        ],
      )
    );
  }
}