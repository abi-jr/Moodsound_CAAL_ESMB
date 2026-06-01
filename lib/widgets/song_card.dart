import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../models/song.dart';
import '../providers/favoritos_provider.dart';

class SongCard extends StatefulWidget {
  final Song song;

  const SongCard({super.key, required this.song});

  @override
  State<SongCard> createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  final AudioPlayer player = AudioPlayer();

  bool reproduciendo = false;

  Future<void> reproducir() async {
    await player.play(UrlSource(widget.song.audioUrl));

    setState(() {
      reproduciendo = true;
    });
  }

  Future<void> pausar() async {
    await player.pause();

    setState(() {
      reproduciendo = false;
    });
  }

  void mostrarAnimacionFavorito() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFF121212),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: Lottie.asset(
                    'assets/animation/corazon.json',
                    repeat: false,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Agregado a favoritos ❤️",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoritos = Provider.of<FavoritosProvider>(context);

    bool esFavorito = favoritos.esFavorito(widget.song);

    return Card(
      margin: const EdgeInsets.all(8),
      color: const Color(0xFF1E1E1E),
      child: ListTile(
        leading: Image.network(
          widget.song.cover,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(
          widget.song.title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          widget.song.artist,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              color: Colors.white,
              icon: Icon(reproduciendo ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                if (reproduciendo) {
                  pausar();
                } else {
                  reproducir();
                }
              },
            ),

            IconButton(
              icon: Icon(
                esFavorito ? Icons.favorite : Icons.favorite_border,
                color: esFavorito ? Colors.red : Colors.white,
              ),
              onPressed: () {
                if (esFavorito) {
                  favoritos.eliminarFavorito(widget.song);
                } else {
                  favoritos.agregarFavorito(widget.song);
                  mostrarAnimacionFavorito();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
