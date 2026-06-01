import 'package:flutter/material.dart';

import '../models/song.dart';
import '../services/api_service.dart';
import '../widgets/song_card.dart';

class SongsScreen extends StatefulWidget {
  final String mood;

  const SongsScreen({super.key, required this.mood});

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  late Future<List<Song>> canciones;

  @override
  void initState() {
    super.initState();
    canciones = ApiService().obtenerCanciones(widget.mood);
  }

  String getEmoji() {
    switch (widget.mood.toLowerCase()) {
      case 'happy':
        return '😊';
      case 'sad':
        return '😢';
      case 'chill':
        return '😌';
      case 'workout':
        return '💪';
      case 'rock':
        return '🎸';
      default:
        return '🎵';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.mood.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
      body: FutureBuilder<List<Song>>(
        future: canciones,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF1DB954)),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error al cargar canciones\n${snapshot.error}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white70),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No se encontraron canciones',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }

          final lista = snapshot.data!;

          return Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(getEmoji(), style: const TextStyle(fontSize: 80)),
                    const SizedBox(height: 12),
                    Text(
                      widget.mood.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${lista.length} canciones',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Card(
                        color: const Color(0xFF1E1E1E),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: SongCard(song: lista[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
