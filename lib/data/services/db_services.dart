import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/domain/entities/scan_model.dart';
export 'package:qr_reader/domain/entities/scan_model.dart';

class DBProvider{

  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future <Database> get database async{
    if(_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future <Database> initDB()async{
    // path donde almacenaremos la base de datos
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentDirectory.path, 'ScansDB.db');

    return await openDatabase (
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version)async{
        await db.execute('''
            CREATE TABLE Scans(
              id INTEGER PRIMARY KEY,
              tipo TEXT,
              valor Text
            )
        ''');
      }
    );
  }

  Future<int> nuevoScanRaw(ScanModel nuevoScan)async{

    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    // verificamos la base de datos
    final db = await database;

    final res = await db.rawInsert('''

      INSERT INTO Scans (id, tipo, valor)
        VALUES($id, $tipo, $valor)
    ''');
    return res;

  }
  // crear un nuevo registro de Scan
  Future<int> nuevoScan (ScanModel nuevoScan)async{
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toMap());
    print(res);
    return res;
  }
  // obtener un registro Scan por id
  Future<ScanModel?> getScanById (int id)async{
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty
            ?ScanModel.fromMap(res.first)
            :null;
  }
  // obtener todos los Scans
  Future<List<ScanModel>?>getAllScans()async{
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty
        ?res.map((e) => ScanModel.fromMap(e)).toList()
        :[];
  }
  // obtener los Scan por su tipo
  Future<List<ScanModel>?>getAllScansByTipo(String tipo)async{
    final db = await database;
    final res = await db.query('Scans',where:'tipo = ?', whereArgs: [tipo] );
    return res.isNotEmpty
        ?res.map((e) => ScanModel.fromMap(e)).toList()
        :[];
  }

  // actualizar un Scan
  Future<int> updateScan(ScanModel scan)async{
    final db = await database;
    final res = await db.update('Scans', scan.toMap(), where: 'id=?', whereArgs: [scan.id]);
    return res;
  }

  // eliminar un Scan
  Future<int> deleteScan(int id)async{
    final db = await database;
    final res = await db.delete('Scans', where: 'id=?', whereArgs: [id]);
    return res;
  }

  // eliminar todos los Scans
  Future<int> deleteAllScans()async{
    final db = await database;
    final res = await db.delete('Scans');
    return res;
  }

  // // eliminar los scans por tipo
  Future<int> deleteScansByTipo(String tipo)async{
    final db = await database;
    final res = await db.delete('Scans', where: 'tipo = ?', whereArgs: [tipo]);
    return res;
  }


}