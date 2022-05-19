import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/data/providers/scan_list_provider.dart';
import 'package:qr_reader/presentation/utils/utils.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async{
        // String barcodeScanRes = 
        //       await FlutterBarcodeScanner.scanBarcode(
        //                                             '#3D8BEF', 
        //                                             'Cancelar', 
        //                                             false, 
        //                                             ScanMode.QR);

        // String barcodeScanRes = 'geo:-9.087441,-78.560180';
        // String barcodeScanRes = 'https://www.google.com';
        String barcodeScanRes = 'geo:-9.086932817943936,-78.56023933316528';
        final scanListProvider = Provider.of<ScanListProvider>(context,listen: false);
        final nuevoScan = await scanListProvider.nuevoSan(barcodeScanRes);
        launchURL(context, nuevoScan);
        // print(barcodeScanRes);
      },
    );
  }
}