import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/data/providers/scan_list_provider.dart';
import 'package:qr_reader/presentation/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';


class ScanTiles extends StatelessWidget {
  final String tipo;

  ScanTiles({required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scans = Provider.of<ScanListProvider>(context).scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key:UniqueKey(),
        onDismissed: (direction){
          Provider.of<ScanListProvider>(context,listen: false).borrarScanPorId(scans[i].id!);
        },
        background: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.red,
          child: const Icon(Icons.cancel),
        ),
        child: ListTile(
          leading: Icon(
            tipo=='web'
            ?Icons.home_outlined
            :Icons.map_outlined, 
            color: Theme.of(context).primaryColor
          ),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing:  const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: ()async{
            launchURL(context, scans[i]);
          },
        ),
      )
    );
  }
}