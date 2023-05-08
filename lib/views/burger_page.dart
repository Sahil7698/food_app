import 'package:flutter/material.dart';
import 'package:food_app/views/details_page.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerPage extends StatefulWidget {
  const BurgerPage({Key? key}) : super(key: key);

  @override
  State<BurgerPage> createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.location_on,
              color: Colors.deepPurple,
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
              color: Colors.deepPurple,
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
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 20, top: 10),
            child: Text(
              "Hi Sahil",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
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
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                  Text(
                    "Search Food",
                    style:
                        GoogleFonts.poppins(color: Colors.grey, fontSize: 18),
                  ),
                  const SizedBox(
                    width: 170,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple,
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
                categories(image: "assets/images/1.png", title: "All"),
                categories(image: "assets/images/2.png", title: "Burger"),
                categories(image: "assets/images/3.png", title: "Drinks"),
                categories(image: "assets/images/4.png", title: "Recipe"),
                categories(image: "assets/images/5.png", title: "Snacks"),
              ],
            ),
          ),
          Container(
            height: 450,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 1,
              primary: false,
              shrinkWrap: false,
              childAspectRatio: 0.75,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailPage(),
                      ),
                    );
                  },
                  child: itemCountainer(
                    image: "assets/images/1.png",
                    name: "Pizza",
                    price: "780",
                  ),
                ),
                itemCountainer(
                    image: "assets/images/2.png", name: "Burger", price: "120"),
                itemCountainer(
                    image: "assets/images/3.png", name: "Drinks", price: "30"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemCountainer(
      {required String image, required String name, required String price}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 260,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepPurple.shade50,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.deepPurple.shade50,
              backgroundImage: AssetImage(
                image,
              ),
            ),
            ListTile(
              leading: Text(
                name,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                "₹ $price",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
            color: Colors.deepPurple.shade50,
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
