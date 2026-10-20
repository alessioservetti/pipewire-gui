import 'package:flutter/material.dart';
import 'package:pipewire_gui/core/theme/app_theme.dart';
import 'package:pipewire_gui/features/patchbay/presentation/patchbay_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PipeWire GUI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      // Scaffold: where the SnackBars of the patchbay show up.
      home: const Scaffold(body: PatchbayPage()),
    );
  }
}
