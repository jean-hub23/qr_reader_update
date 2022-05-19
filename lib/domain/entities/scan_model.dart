import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScanModel {
    ScanModel({
        this.id,
        this.tipo,
        required this.valor,
    })
    
    {
      if(valor.contains('http')){
        tipo = 'web';
      }else{
        tipo = 'geo';
      }
    }

    int? id;
    String? tipo;
    String valor;


    LatLng getLatLng(){
      final latlng = valor.substring(4).split(',');
      final lat = double.parse(latlng[0]);
      final lng = double.parse(latlng[1]);
      return LatLng(lat, lng);
    }


    factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
