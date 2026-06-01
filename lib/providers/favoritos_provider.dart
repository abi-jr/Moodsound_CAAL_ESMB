import 'package:flutter/material.dart';
import '../models/song.dart';

class FavoritosProvider extends ChangeNotifier {
  final List<Song> _favoritos = [];

  List<Song> get favoritos => _favoritos;

  void agregarFavorito(Song song) {
    _favoritos.add(song);
    notifyListeners();
  }

  void eliminarFavorito(Song song) {
    _favoritos.remove(song);
    notifyListeners();
  }

  bool esFavorito(Song song) {
    return _favoritos.contains(song);
  }
}
