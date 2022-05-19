import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_reader/domain/entities/scan_model.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapPage extends StatefulWidget {

  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();  
  MapType tipoMapa = MapType.satellite;

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    Set<Marker> markers = <Marker>{};

    final CameraPosition _positionCamera = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17.5,
      tilt: 50,
    );

    markers.add(Marker(
      markerId: const MarkerId('geo-location'),
      position: scan.getLatLng(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapas con Flutter y Google Maps'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: ()async{
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: scan.getLatLng(), 
                  zoom: 17.5,
                  tilt: 50,
                ),
                )
              );
            }, 
            icon: const Icon(Icons.add_location)
          )
        ],
      ),
      body: GoogleMap(
        markers: markers,
        zoomControlsEnabled: false,
        mapType: tipoMapa,
        initialCameraPosition: _positionCamera,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(tipoMapa == MapType.satellite){
            tipoMapa = MapType.normal;
          }else{
            tipoMapa = MapType.satellite;
          }
          setState((){});
        }, 
        child:const Icon(Icons.layers),
      ),
    );
  }

}