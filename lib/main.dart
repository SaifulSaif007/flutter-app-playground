import 'package:flutter/material.dart';
import 'navigation/go_router_config.dart';

void main() {
  runApp(const PlaceHolderApp());
}

class PlaceHolderApp extends StatelessWidget {
  const PlaceHolderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
