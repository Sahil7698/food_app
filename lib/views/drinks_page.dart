import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/helpers/firestore_helper.dart';

class DrinkPage extends StatefulWidget {
  const DrinkPage({Key? key}) : super(key: key);

  @override
  State<DrinkPage> createState() => _DrinkPageState();
}

class _DrinkPageState extends State<DrinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.location_on,
              color: Colors.red,
            ),
            Text(
              "Kapodra, SURAT",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  fit: BoxFit.cover,
                ),
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 20, top: 10),
                  child: Text(
                    "Hi Sahil",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 20, top: 5),
                  child: Text(
                    "Find your food",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.search,
                          color: Colors.red,
                          size: 30,
                        ),
                        Text(
                          "Search Food",
                          style: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 18),
                        ),
                        const SizedBox(
                          width: 170,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ),
                          child: const Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/home_page');
                        },
                        child: categories(
                            image: "assets/images/1.png", title: "Pizza"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/burger_page');
                        },
                        child: categories(
                          image: "assets/images/2.png",
                          title: "Burger",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/drink_page');
                        },
                        child: categories(
                            image: "assets/images/3.png", title: "Drinks"),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/recipe_page');
                          },
                          child: categories(
                              image: "assets/images/4.png", title: "Recipe")),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/snack_page');
                        },
                        child: categories(
                            image: "assets/images/5.png", title: "Snacks"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                stream: FirestoreHelper.firestoreHelper.drinkRecords(),
                builder: (context, snapShot) {
                  if (snapShot.hasError) {
                    return Center(
                      child: Text("Error : ${snapShot.error}"),
                    );
                  } else if (snapShot.hasData) {
                    QuerySnapshot<Map<String, dynamic>>? data = snapShot.data;

                    if (data == null) {
                      return const Center(
                        child: Text("No Any Data Available...."),
                      );
                    } else {
                      List<QueryDocumentSnapshot<Map<String, dynamic>>>
                          allBurger = data.docs;

                      return GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                        primary: false,
                        shrinkWrap: false,
                        children: List.generate(
                          allBurger.length,
                          (index) => Container(
                            height: 200,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red.shade50,
                            ),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.red.shade50,
                                  backgroundImage: MemoryImage(
                                    base64Decode(
                                      allBurger[index].data()['image'],
                                    ),
                                  ),
                                ),
                                Text(
                                  '${allBurger[index].data()['name']}',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "₹ ${allBurger[index].data()['price']}",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget categories({required String image, required String title}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
