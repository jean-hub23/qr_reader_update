import 'package:flutter/material.dart';

import '../../widgets/widget.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'geo');

  }
}