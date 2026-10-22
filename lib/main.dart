// Finalllll Lab 3
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Menu'),
        //centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 82, 128, 255),
      ),
      body: SafeArea(
        child: ListView(
          children: const [
            MenuCard(
              'https://www.recipetineats.com/tachyon/2023/05/Garlic-cheese-pizza_9.jpg',
              'Garlic Cheese Pizza',
            ),
            MenuCard(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTh3wbUMEd5PdWlI27MV2F7hPMWMuwrxa5kU55BfpRIUguX5BONQywSrvIQ&s=10',
              'Chicken Parmesan Pizza',
            ),
            MenuCard(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLTo_btsWNRt2iU5QKKkriobzIrWaM3zZ83aLRqIrkp9aDrPkN5rGuSoI&s=10',
              'Spinach Mayo Pizza',
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String imgurl;
  final String title;

  const MenuCard(this.imgurl, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: const Color.fromARGB(255, 78, 205, 255),
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                8,
              ), // Optional: rounds image corners nicely
              child: Image.network(
                imgurl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                // Shows a spinner while downloading the image
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  );
                },
                // Fallback icon if the internet fails or the link breaks
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            // Wrapped in Expanded to prevent text overflowing if the title is too long
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize:
                      24, // Reduced slightly from 30 so long names fit easily
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
