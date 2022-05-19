import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/domain/providers/ui_provider.dart';
class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (int i){
        uiProvider.selectedMenuOpt = i;
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'Mapa'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Direcciones'
        ),
      ]
    );


  }
}