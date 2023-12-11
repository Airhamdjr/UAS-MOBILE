import 'dart:convert';
import 'package:http/http.dart' as http;

// Sesuaikan dengan model yang sebenarnya
class GameModal {
  final String id;
  final String name;
  final String genre;
  final String rating;
  final String image;
  final String description;

  GameModal({
    required this.id,
    required this.name,
    required this.genre,
    required this.rating,
    required this.image,
    required this.description,
  });
}

// ...

Future<List<GameModal>> fetchGameData() async {
  final response = await http.get(
      Uri.parse('https://coba1-43e7c-default-rtdb.firebaseio.com/anime/game.json'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    List<GameModal> gameList = [];

    data.forEach((id, value) {
      gameList.add(GameModal(
        id: id,
        name: value['nama'],
        genre: value['genre'],
        rating: value['rating'],
        image: value['gambar'],
        description: value['deskripsi'],
      ));
    });

    return gameList;
  } else {
    throw Exception('Failed to load isekai data');
  }
}
