import 'dart:convert';
import 'package:http/http.dart' as http;

// Sesuaikan dengan model yang sebenarnya
class RekomendasiModal {
  final String id;
  final String name;
  final String genre;
  final String rating;
  final String image;
  final String description;

  RekomendasiModal({
    required this.id,
    required this.name,
    required this.genre,
    required this.rating,
    required this.image,
    required this.description,
  });
}

// ...

Future<List<RekomendasiModal>> fetchRekomendasiData() async {
  final response = await http.get(
      Uri.parse('https://coba1-43e7c-default-rtdb.firebaseio.com/anime/rekomendasi.json'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);

    List<RekomendasiModal> rekomendasiList = [];

    data.forEach((id, value) {
      rekomendasiList.add(RekomendasiModal(
        id: id,
        name: value['nama'],
        genre: value['genre'],
        rating: value['rating'],
        image: value['gambar'],
        description: value['deskripsi'],
      ));
    });

    return rekomendasiList;
  } else {
    throw Exception('Failed to load rekomendasi data');
  }
}
