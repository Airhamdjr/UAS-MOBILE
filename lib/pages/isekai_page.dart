// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mental_app/models/isekai_models.dart';
import 'package:mental_app/pages/detail/isekai_detail.dart';


class IsekaiPage extends StatefulWidget {
  const IsekaiPage({Key? key}) : super(key: key);

  @override
  State<IsekaiPage> createState() => _IsekaiPageState();
}

class _IsekaiPageState extends State<IsekaiPage> {
  late Future<List<IsekaiModal>> isekaiData;

  @override
  void initState() {
    super.initState();
    isekaiData = fetchIsekaiData(); // Replace with your data fetching method
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
        child: FutureBuilder<List<IsekaiModal>>(
          future: isekaiData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<IsekaiModal> isekaiList = snapshot.data!;
                return Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.maxFinite,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(5)),
                              image: DecorationImage(
                                image: AssetImage('assets/isekai.gif'),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 0,
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(15)),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/home');
                                    },
                                    iconSize: 20,
                                    icon: const Icon(Icons.logout),
                                  ),
                                  IconButton(
                                    iconSize: 20,
                                    onPressed: () {},
                                    icon: const Icon(Icons.favorite),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
                                  // Display data from the first item in the list
                                 
                                ],
                              ),
                              // Notifikasi
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.yellow,
                        child: Center(
                          child: Column(
                            children: [
                              // Judul Latihan
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Daftar Anime Isekai',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Icon(Icons.more_horiz),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                           // ListView Latihan
// ListView.builder
Expanded(
  child: ListView.builder(
    itemCount: isekaiList.length,
    itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IsekaiDetailPage(isekai: isekaiList[index]),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black, // Set your desired background color
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    isekaiList[index].image,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                // Nama dan Rating di sebelah kanan
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nama Anime
                      Text(
                        isekaiList[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.yellow,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Rating
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text(
                            '${isekaiList[index].rating}',
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
    },
  ),
),



                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                // Data failed to load
                return Center(
                  child: Text('Failed to load data'),
                );
              }
            }
            // Data is still loading
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
