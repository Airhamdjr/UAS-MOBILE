import 'dart:convert';
import 'package:http/http.dart' as http;

// Sesuaikan dengan model yang sebenarnya
class ActionModal {
  final String id;
  final String name;
  final String genre;
  final String rating;
  final String image;
  final String description;

  ActionModal({
    required this.id,
    required this.name,
    required this.genre,
    required this.rating,
    required this.image,
    required this.description,
  });
}

// ...

Future<List<ActionModal>> fetchActionData() async {
  final response = await http.get(
      Uri.parse('https://coba1-43e7c-default-rtdb.firebaseio.com/anime/action.json'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    List<ActionModal> actionList = [];

    data.forEach((id, value) {
      actionList.add(ActionModal(
        id: id,
        name: value['nama'],
        genre: value['genre'],
        rating: value['rating'],
        image: value['gambar'],
        description: value['deskripsi'],
      ));
    });

    return actionList;
  } else {
    throw Exception('Failed to load isekai data');
  }
}
