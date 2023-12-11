import 'package:flutter/material.dart';
import 'package:mental_app/models/game_models.dart';

class GameDetailPage extends StatelessWidget {
  final GameModal game;

  const GameDetailPage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          game.name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Warna teks pada AppBar
          ),
        ),
        backgroundColor: Colors.black, // Warna latar belakang AppBar
      ),
      backgroundColor: Colors.grey[900], // Warna latar belakang utama
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    game.image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rating: ${game.rating}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Genre: ${game.genre}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[800], // Warna latar belakang deskripsi
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Description: ${game.description}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Warna teks deskripsi
                  ),
                  // Menambahkan property maxLines dan overflow agar deskripsi dapat menampung banyak baris
                  maxLines: null,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
