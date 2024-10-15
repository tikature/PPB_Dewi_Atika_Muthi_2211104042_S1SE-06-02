import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Malang',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: const WisataMalangPage(),
    );
  }
}

class WisataMalangPage extends StatelessWidget {
  const WisataMalangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Malang'),
        backgroundColor: const Color.fromARGB(255, 167, 255, 160),
      ),
      body: ListView(
        children: const [
          WisataItem(
            image:
                'https://upload.wikimedia.org/wikipedia/commons/e/ec/Mount_Bromo_panorama.jpg',
            name: 'Gunung Bromo',
            description:
                'Gunung berapi aktif dengan pemandangan matahari terbit yang menakjubkan.',
            color: Colors.orange,
            icon: Icons.landscape,
          ),
          WisataItem(
            image:
                'https://img.inews.co.id/media/1200/files/inews_new/2021/08/09/jatim_park.jpg',
            name: 'Jatim Park',
            description:
                'Taman hiburan keluarga dengan berbagai wahana dan atraksi menarik.',
            color: Colors.blue,
            icon: Icons.attractions,
          ),
          WisataItem(
            image:
                'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/231/2024/09/11/Segarnya-suasana-kawasan-Air-Terjun-Coban-Rondo-Gambar-dari-Dhiky-Aditya-Shutterstock-1200347082.png',
            name: 'Air Terjun Coban Rondo',
            description:
                'Air terjun indah dengan ketinggian 84 meter, dikelilingi hutan pinus.',
            color: Colors.teal,
            icon: Icons.water_drop,
          ),
          WisataItem(
            image:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Batu_Secret_Zoo.jpg/300px-Batu_Secret_Zoo.jpg',
            name: 'Batu Secret Zoo',
            description:
                'Kebun binatang modern dengan koleksi hewan dari berbagai belahan dunia.',
            color: Colors.green,
            icon: Icons.pets,
          ),
          WisataItem(
            image:
                'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/74/2024/03/27/Pantai-Balekambang-1601454064.png',
            name: 'Pantai Balekambang',
            description:
                'Pantai eksotis dengan Pura Amerta Jati yang menyerupai Tanah Lot di Bali.',
            color: Colors.blue,
            icon: Icons.beach_access,
          ),
        ],
      ),
    );
  }
}

class WisataItem extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final Color color;
  final IconData icon;

  const WisataItem({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.network(
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: color.withOpacity(0.1),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, color: color),
                    const SizedBox(width: 8),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
