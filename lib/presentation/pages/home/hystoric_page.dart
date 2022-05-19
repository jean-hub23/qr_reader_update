import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/presentation/pages/home/widgets/drawer.dart';
import 'package:qr_reader/presentation/pages/pages.dart';
import 'package:qr_reader/domain/providers/ui_provider.dart';
import 'package:qr_reader/presentation/widgets/widget.dart';
import 'package:qr_reader/data/providers/scan_list_provider.dart';

class HistoricPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(), 
      appBar: AppBar(
        title: const Text('Historial'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: (){
              final uiProvider = Provider.of<UiProvider>(context, listen: false);
              print('borrar los historiales de ${uiProvider.selectedMenuOpt}');
              final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
              if(uiProvider.selectedMenuOpt==0){
                scanListProvider.borrarPorTipo('geo');
              }else{
                scanListProvider.borrarPorTipo('web');
              }
            }, 
          )
        ],
      ),
      body:_HistoricPageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HistoricPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    // final tempScan = ScanModel(valor:'geo: 122.557,452.154');
    // final tempScan = ScanModel(valor:'https://www.prueba.com');
    // DBProvider.db.nuevoScan(tempScan);
    // DBProvider.db.getScanById(6).then((scan) => print(scan!.tipo));
    // DBProvider.db.getAllScans().then((scan) => print(scan));
    // DBProvider.db.getAllScans().then((scans) => print(scans![10].valor));
    // DBProvider.db.getAllScansByTipo('web').then((scan) => print(scan));
    // DBProvider.db.updateScan(ScanModel(id: 5, tipo: 'geo', valor: 'geo: 50.557,70.82')).then((value) => print(value));
    switch (currentIndex) {
      case 0:
        // return const MapasPage();
        scanListProvider.cargarScansPorTipo('geo');
        return ScanTiles(tipo: 'geo');
      case 1:
        // return DireccionesPage();
        scanListProvider.cargarScansPorTipo('web');
        return ScanTiles(tipo: 'web');
      default:
        return const MapasPage();
    }
    
  }
}