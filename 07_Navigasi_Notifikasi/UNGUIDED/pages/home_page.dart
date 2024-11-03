import 'package:flutter/material.dart';
import 'package:unmd7/models/product.dart';
import 'package:unmd7/pages/detail_page.dart';
import 'package:unmd7/pages/cart_page.dart';

class HomePage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      name: "Lipstick Matte Rose",
      price: 129000,
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTazzqNSr7CLoODfN0MB5MVoeMquNYRM9aFgQ&s",
      description:
          "Lipstick matte dengan formula tahan lama, mengandung vitamin E untuk melembabkan bibir.",
      category: "Lips",
      rating: 4.8,
    ),
    Product(
      id: 2,
      name: "Foundation Natural Glow",
      price: 289000,
      imageUrl:
          "https://lumene.com/cdn/shop/files/297_35aa0be2-1dee-443f-8d19-eaf42b62845a.jpg?v=1704168239&width=3000",
      description:
          "Foundation dengan coverage medium to full, memberikan hasil akhir natural glowing.",
      category: "Face",
      rating: 4.7,
    ),
    Product(
      id: 3,
      name: "Mascara Waterproof",
      price: 159000,
      imageUrl:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/MTA-109085722/no_brand_esenses_mascara_waterproof_volume_8_ml_full01_p0ta09p1.jpg",
      description:
          "Mascara waterproof yang membuat bulu mata lebih tebal dan panjang.",
      category: "Eyes",
      rating: 4.6,
    ),
    Product(
      id: 4,
      name: "Matte Cushion",
      price: 149000,
      imageUrl:
          "https://img.ws.mms.shopee.co.id/id-11134207-7r98w-lwwzruhwlkrf4f",
      description:
          "Matte cushion yang cocok untuk kulit oily kamu dan bisa menahan kulit berminyakmu 24 jam!",
      category: "Eyes",
      rating: 4.6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beauty Shop'),
        backgroundColor: Colors.pink[100],
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(product: product),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Rp ${product.price.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
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
