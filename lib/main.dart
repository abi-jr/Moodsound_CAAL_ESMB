import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/favoritos_provider.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MoodSoundApp());
}

class MoodSoundApp extends StatelessWidget {
  const MoodSoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FavoritosProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MoodSound',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurple,
        ),

        home: const SplashScreen(),
      ),
    );
  }
}
