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
        primaryColor: Color.fromARGB(255, 143, 221, 243),
        fontFamily: 'Roboto',
      ),
      home: const WisataMalangPage(),
    );
  }
}

class WisataMalangPage extends StatelessWidget {
  const WisataMalangPage({Key? key}) : super(key: key);

  final List<WisataItemData> wisataList = const [
    WisataItemData(
      image:
          'https://img.inews.co.id/media/1200/files/inews_new/2021/08/09/jatim_park.jpg',
      name: 'Jatim Park',
      description:
          'Taman hiburan keluarga dengan berbagai wahana dan atraksi menarik.',
      color: Colors.blue,
      icon: Icons.attractions,
    ),
    WisataItemData(
      image:
          'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/231/2024/09/11/Segarnya-suasana-kawasan-Air-Terjun-Coban-Rondo-Gambar-dari-Dhiky-Aditya-Shutterstock-1200347082.png',
      name: 'Air Terjun Coban Rondo',
      description:
          'Air terjun indah dengan ketinggian 84 meter, dikelilingi hutan pinus.',
      color: Colors.teal,
      icon: Icons.water_drop,
    ),
    WisataItemData(
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Batu_Secret_Zoo.jpg/300px-Batu_Secret_Zoo.jpg',
      name: 'Batu Secret Zoo',
      description:
          'Kebun binatang modern dengan koleksi hewan dari berbagai belahan dunia.',
      color: Colors.green,
      icon: Icons.pets,
    ),
    WisataItemData(
      image:
          'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/74/2024/03/27/Pantai-Balekambang-1601454064.png',
      name: 'Pantai Balekambang',
      description:
          'Pantai eksotis dengan Pura Amerta Jati yang menyerupai Tanah Lot di Bali.',
      color: Colors.blue,
      icon: Icons.beach_access,
    ),
    WisataItemData(
      image:
          'https://upload.wikimedia.org/wikipedia/commons/e/ec/Mount_Bromo_panorama.jpg',
      name: 'Gunung Bromo',
      description:
          'Gunung berapi aktif dengan pemandangan matahari terbit yang menakjubkan.',
      color: Colors.orange,
      icon: Icons.landscape,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Wisata Malang',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Image.network(
                'https://asset.kompas.com/crops/ikjJCPl21V1kdUT6o12wRqPpEAk=/0x363:765x873/750x500/data/photo/2023/12/26/658a7bf12e3f1.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 143, 221, 243),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Tempat Wisata Populer',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300.0,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return WisataItemCard(wisata: wisataList[index]);
                },
                childCount: wisataList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WisataItemData {
  final String image;
  final String name;
  final String description;
  final Color color;
  final IconData icon;

  const WisataItemData({
    required this.image,
    required this.name,
    required this.description,
    required this.color,
    required this.icon,
  });
}

class WisataItemCard extends StatelessWidget {
  final WisataItemData wisata;

  const WisataItemCard({Key? key, required this.wisata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                wisata.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wisata.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: wisata.color,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    wisata.description,
                    style: TextStyle(fontSize: 12),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
