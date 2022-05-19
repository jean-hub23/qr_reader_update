import 'package:flutter/material.dart';
import 'package:qr_reader/presentation/widgets/widget.dart';

class DireccionesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'web');
  }

}