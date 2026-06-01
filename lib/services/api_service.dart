import '../models/song.dart';

class ApiService {
  Future<List<Song>> obtenerCanciones(String mood) async {
    await Future.delayed(const Duration(seconds: 1));

    switch (mood.toLowerCase()) {
      case 'happy':
        return [
          Song(
            title: 'Happy Mood',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?1',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
          ),
          Song(
            title: 'Good Vibes',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?2',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
          ),
          Song(
            title: 'Sunshine Day',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?7',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3',
          ),
        ];

      case 'sad':
        return [
          Song(
            title: 'Sad Moments',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?3',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
          ),
          Song(
            title: 'Broken Silence',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?8',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3',
          ),
          Song(
            title: 'Lonely Night',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?9',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3',
          ),
        ];

      case 'chill':
        return [
          Song(
            title: 'Relax Time',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?4',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3',
          ),
          Song(
            title: 'Soft Waves',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?10',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3',
          ),
          Song(
            title: 'Night Chill',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?11',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-11.mp3',
          ),
        ];

      case 'workout':
        return [
          Song(
            title: 'Workout Energy',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?5',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3',
          ),
          Song(
            title: 'Push Harder',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?12',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-12.mp3',
          ),
          Song(
            title: 'Beast Mode',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?13',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3',
          ),
        ];

      case 'rock':
        return [
          Song(
            title: 'Rock Power',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?6',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3',
          ),
          Song(
            title: 'Electric Storm',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?14',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-14.mp3',
          ),
          Song(
            title: 'Guitar Rage',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?15',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-15.mp3',
          ),
        ];

      case 'focus':
        return [
          Song(
            title: 'Deep Focus',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?16',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-16.mp3',
          ),
          Song(
            title: 'Study Flow',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?17',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-17.mp3',
          ),
        ];

      default:
        return [
          Song(
            title: 'Default Vibes',
            artist: 'MoodSound',
            cover: 'https://picsum.photos/200?99',
            audioUrl:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
          ),
        ];
    }
  }
}
