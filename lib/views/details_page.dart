import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  final Map data;
  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Page",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ))
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.red,
            alignment: Alignment.bottomCenter,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              height: 700,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 150,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.data['name']}",
                                style: GoogleFonts.exo2(
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  "${widget.data['price']} ₹",
                                  style: GoogleFonts.exo2(
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 60,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      (i > 1) ? i-- : null;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                Text(
                                  "$i",
                                  style: GoogleFonts.exo2(
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      i++;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "About food",
                              style: GoogleFonts.exo2(
                                textStyle: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "${widget.data['des']}",
                            style: GoogleFonts.exo2(
                              textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 450,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: MemoryImage(
                    base64Decode(widget.data['image']),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
