import 'package:flutter/material.dart';
import 'package:mental_app/models/rekomendasi_models.dart';
import 'package:mental_app/pages/detail/rekomendasi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<RekomendasiModal>> homePageData;
  late List<RekomendasiModal> allRekomendasiList;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    homePageData = fetchRekomendasiData();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 48, 48),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      //   ],
      // ),
      body: SafeArea(
        child: FutureBuilder<List<RekomendasiModal>>(
          future: homePageData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                allRekomendasiList = snapshot.data!;
                List<RekomendasiModal> displayedList = searchController.text.isEmpty
                    ? allRekomendasiList
                    : allRekomendasiList
                        .where((rekomendasi) =>
                            rekomendasi.name.toLowerCase().contains(
                                  searchController.text.toLowerCase(),
                                ))
                        .toList();

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Selamat Datang',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Mau Nonton Anime Apa?',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                padding: EdgeInsets.all(9),
                                child: Icon(
                                  Icons.notifications,
                                  color: const Color.fromARGB(255, 48, 47, 47),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow[600],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: searchController,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      hintText: 'Search',
                                      hintStyle: TextStyle(color: Colors.black),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'CATEGORIES',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.more_horiz,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                buildCategory('Action', 'assets/action.webp', '/action'),
                                buildCategory('Isekai', 'assets/isekai.gif', '/isekai'),
                                buildCategory('Fantasy', 'assets/fantasy.webp', '/fantasy'),
                                buildCategory('Game', 'assets/ngnl.gif', '/game'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Rekomendasi Anime',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: displayedList.length,
                        itemBuilder: (context, index) {
                          return buildAnimeCard(displayedList[index]);
                        },
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Gagal memuat data'),
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget buildCategory(String categoryName, String imagePath, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 200,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            categoryName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAnimeCard(RekomendasiModal rekomendasi) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RekomendasiDetailPage(
              rekomendasi: rekomendasi,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  rekomendasi.image,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rekomendasi.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.yellow,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text(
                          '${rekomendasi.rating}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
