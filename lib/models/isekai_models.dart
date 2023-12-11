import 'dart:convert';
import 'package:http/http.dart' as http;

// Sesuaikan dengan model yang sebenarnya
class IsekaiModal {
  final String id;
  final String name;
  final String genre;
  final String rating;
  final String image;
  final String description;

  IsekaiModal({
    required this.id,
    required this.name,
    required this.genre,
    required this.rating,
    required this.image,
    required this.description,
  });
}

// ...

Future<List<IsekaiModal>> fetchIsekaiData() async {
  final response = await http.get(
      Uri.parse('https://coba1-43e7c-default-rtdb.firebaseio.com/anime/isekai.json'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    List<IsekaiModal> isekaiList = [];

    data.forEach((id, value) {
      isekaiList.add(IsekaiModal(
        id: id,
        name: value['nama'],
        genre: value['genre'],
        rating: value['rating'],
        image: value['gambar'],
        description: value['deskripsi'],
      ));
    });

    return isekaiList;
  } else {
    throw Exception('Failed to load isekai data');
  }
}
