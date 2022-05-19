import 'package:flutter/material.dart';
import 'package:qr_reader/data/services/db_services.dart';


class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans = [];

  String tipoSelecionado = 'web';

  Future<ScanModel> nuevoSan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;
    if(tipoSelecionado==nuevoScan.tipo){
      scans.add(nuevoScan);
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    final scans = await DBProvider.db.getAllScansByTipo(tipo);
    this.scans = [...?scans];
    tipoSelecionado = tipo;
    notifyListeners();
  }

  borrarTodos()async{
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrarScanPorId( int id )async{
    await DBProvider.db.deleteScan(id);
  }

  borrarPorTipo(String tipo)async{
    await DBProvider.db.deleteScansByTipo(tipo);
    cargarScansPorTipo(tipo);
    notifyListeners();
  }



}