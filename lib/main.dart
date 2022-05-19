import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/data/providers/scan_list_provider.dart';
import 'package:qr_reader/domain/providers/theme_provider.dart';
import 'package:qr_reader/domain/providers/ui_provider.dart';
import 'package:qr_reader/devices/preferences.dart';
import 'package:qr_reader/presentation/pages/pages.dart';
import 'package:qr_reader/theme/theme.dart';

void main() async {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider(
          isDarkMode: Preferences.isDarkMode
        )),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: 'home',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      routes: {
        'home': ( _ ) => const HomePage(),
        'historic': ( _ ) => HistoricPage(),
        'map' : ( _ ) => const MapPage(),
        'settings': ( _ ) => const SettingsPage(),
      },
    );
  }
}
