import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe Menu',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cafe Menu'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.restaurant_menu), text: 'Makanan'),
            Tab(icon: Icon(Icons.wine_bar), text: 'Minuman'),
            Tab(icon: Icon(Icons.cake), text: 'Dessert'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MenuSection(items: [
            MenuItem(
              name: 'Classic Beef Burger',
              price: 'Rp 65.000',
              description: 'Beef patty, lettuce, tomato, cheese, special sauce',
              imageUrl:
                  'https://simply-delicious-food.com/wp-content/uploads/2020/08/Bourbon-basted-cheeseburger-2-500x500.jpg',
            ),
            MenuItem(
              name: 'Grilled Sirloin Steak',
              price: 'Rp 125.000',
              description:
                  '200g Australian beef with mashed potato and vegetables',
              imageUrl:
                  //'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH_CPDkelQirmnMQSD1v8gNt16JQbvzd4A3SAQoadXjMJJtcL5mkwY7t-UbpY6cr9nqgE&usqp=CAU',
                  'https://www.foodfirefriends.com/wp-content/uploads/2020/05/sirloin-steak.jpg',
            ),
            MenuItem(
              name: 'Spaghetti Carbonara',
              price: 'Rp 58.000',
              description: 'Creamy pasta with beef bacon and parmesan cheese',
              imageUrl:
                  'https://girlcarnivore.com/wp-content/uploads/2021/01/Classic-Carbonara-with-Prosciutto-34.jpg',
            ),
            MenuItem(
              name: 'Caesar Salad',
              price: 'Rp 45.000',
              description:
                  'Romaine lettuce, grilled chicken, croutons, caesar dressing',
              imageUrl:
                  //'https://lindseyeatsla.com/wp-content/uploads/2021/10/Lindseyeats_Classic_Caesar_Salad-2.jpg',
                  'https://www.acouplecooks.com/wp-content/uploads/2020/06/Caesar-Salad-054.jpg',
            ),
            MenuItem(
              name: 'Fish & Chips',
              price: 'Rp 68.000',
              description: 'Crispy dory fish with fries and tartar sauce',
              imageUrl:
                  'https://www.thecandidcooks.com/wp-content/uploads/2022/07/fish-and-chips-feature1-1024x683.jpg',
            ),
            MenuItem(
              name: 'Club Sandwich',
              price: 'Rp 52.000',
              description:
                  'Triple decker with chicken, egg, bacon, and vegetables',
              imageUrl:
                  'https://t4.ftcdn.net/jpg/02/58/91/65/240_F_258916556_B6oirjJOKQkaxs39KPi9wjf9ePlT7zF8.jpg',
            ),
          ]),
          MenuSection(items: [
            MenuItem(
              name: 'Iced Americano',
              price: 'Rp 28.000',
              description: 'Double shot espresso with cold water',
              imageUrl:
                  'https://129247483.cdn6.editmysite.com/uploads/1/2/9/2/129247483/s838334798597674802_p1080_i1_w1080.jpeg',
            ),
            MenuItem(
              name: 'Caramel Frappe',
              price: 'Rp 35.000',
              description: 'Blended coffee with caramel and whipped cream',
              imageUrl:
                  'https://images.stockcake.com/public/c/d/6/cd631227-f94a-4f92-a29f-86968a727c9c_large/caramel-frappe-delight-stockcake.jpg',
            ),
            MenuItem(
              name: 'Fresh Lemonade',
              price: 'Rp 25.000',
              description: 'Freshly squeezed lemon with mint leaves',
              imageUrl:
                  'https://www.cocktailcontessa.com/wp-content/uploads/2022/06/bourbon-lemonade-14-768x1024.jpg',
            ),
            MenuItem(
              name: 'Strawberry Milkshake',
              price: 'Rp 32.000',
              description: 'Creamy milkshake with fresh strawberries',
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSAKx94LNOFmPRNNP9l-2B3blPUrXitYnl-Q&s',
            ),
          ]),
          MenuSection(items: [
            MenuItem(
              name: 'New York Cheesecake',
              price: 'Rp 42.000',
              description: 'Classic cheesecake with berry compote',
              imageUrl:
                  'https://www.chocolatemoosey.com/wp-content/uploads/2022/12/7-Inch-Cheesecake-Recipe-photo-8088.jpg',
            ),
            MenuItem(
              name: 'Apple Pie',
              price: 'Rp 38.000',
              description: 'Warm apple pie with vanilla ice cream',
              imageUrl:
                  'https://www.thebittersideofsweet.com/wp-content/uploads/2023/09/Simple-Apple-Pie-SQ.jpg',
            ),
            MenuItem(
              name: 'Chocolate Brownie',
              price: 'Rp 35.000',
              description: 'Warm chocolate brownie with vanilla ice cream',
              imageUrl: 'https://vegetarianforlife.org.uk/images/Brownie.jpg',
            ),
          ]),
        ],
      ),
    );
  }
}

class MenuItem {
  final String name;
  final String price;
  final String description;
  final String imageUrl;

  const MenuItem({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

class MenuSection extends StatelessWidget {
  final List<MenuItem> items;

  const MenuSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(item: item),
                ),
              );
            },
            child: SizedBox(
              height: 120,
              child: Row(
                children: [
                  // Gambar di sisi kiri
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.horizontal(left: Radius.circular(4)),
                    child: Image.network(
                      item.imageUrl,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Informasi menu di sisi kanan
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  item.name,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                item.price,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.green),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Expanded(
                            child: Text(
                              item.description,
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Tombol Order
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Item ditambahkan ke keranjang'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.add_shopping_cart),
                                label: const Text('Order'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  final MenuItem item;

  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              item.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      Text(
                        item.price,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Deskripsi',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item ditambahkan ke keranjang'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Tambah ke Keranjang'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
