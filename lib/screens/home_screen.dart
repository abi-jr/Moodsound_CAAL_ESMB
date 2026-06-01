import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'favoritos_screen.dart';
import 'login_screen.dart';
import 'songs_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  void abrirMood(BuildContext context, String mood) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SongsScreen(mood: mood)),
    );
  }

  final List<Map<String, String>> moods = [
    {'emoji': '😊', 'texto': 'Happy'},
    {'emoji': '😢', 'texto': 'Sad'},
    {'emoji': '😎', 'texto': 'Chill'},
    {'emoji': '🔥', 'texto': 'Workout'},
    {'emoji': '🎸', 'texto': 'Rock'},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),

        appBar: AppBar(
          backgroundColor: const Color(0xFF121212),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Moodsic",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),

          bottom: const TabBar(
            indicatorColor: Color(0xFF1DB954),
            labelColor: Color(0xFF1DB954),
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.music_note), text: "Canciones"),
              Tab(icon: Icon(Icons.favorite), text: "Favoritos"),
              Tab(icon: Icon(Icons.settings), text: "Opciones"),
            ],
          ),
        ),

        body: TabBarView(
          children: [_buildCanciones(), _buildFavoritos(), _buildOpciones()],
        ),
      ),
    );
  }

  Widget _buildCanciones() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "¿Cómo te sientes hoy?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            "Selecciona un estado de ánimo",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: GridView.builder(
              itemCount: moods.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                final mood = moods[index];

                return TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 500 + (index * 150)),
                  tween: Tween(begin: 0, end: 1),
                  curve: Curves.elasticOut,
                  builder: (context, value, child) {
                    return Transform.scale(scale: value, child: child);
                  },
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () =>
                        abrirMood(context, mood['texto']!.toLowerCase()),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF1DB954), Color(0xFF169C46)],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            mood['emoji']!,
                            style: const TextStyle(fontSize: 42),
                          ),

                          const SizedBox(height: 10),

                          Text(
                            mood['texto']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritos() {
    return const FavoritosScreen();
  }

  Widget _buildOpciones() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  "Cerrar Sesión",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white54,
                  size: 16,
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                },
              ),

              const Divider(color: Colors.white24, height: 1),

              ListTile(
                leading: const Icon(Icons.exit_to_app, color: Colors.white),
                title: const Text(
                  "Salir de la App",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white54,
                  size: 16,
                ),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
