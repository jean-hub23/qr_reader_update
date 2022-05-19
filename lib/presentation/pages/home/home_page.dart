import 'package:flutter/material.dart';
import 'package:qr_reader/devices/preferences.dart';
import 'package:qr_reader/presentation/pages/home/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final textstyle = TextStyle(
        fontSize: 30,
      );
    return Scaffold(
      drawer: DrawerWidget(), 
      appBar: AppBar(
        title: const Text('Bienvenidos'),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: ${Preferences.name}', style: textstyle,),
            const Divider(),
            Preferences.gender ==1 
              ?Text('Sexo: Masculino', style: textstyle)
              :Text('Sexo: Femenino', style: textstyle),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Modo: ', style: textstyle,),
                Preferences.isDarkMode? const Icon(Icons.nightlight) : const Icon(Icons.light_mode),
              ],
            ),
            const Divider(),
            
          ],
        ),
      ),
    );
  }
}
