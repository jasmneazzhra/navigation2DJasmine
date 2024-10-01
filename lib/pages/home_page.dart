import 'package:flutter/material.dart';
import '../models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Spidey Bites',
      price: 25999,
      description:
          "Spidey Bites adalah camilan manis yang penuh dengan kelezatan. Terbuat dari bahan berkualitas tinggi dan campuran cokelat yang kaya rasa, setiap gigitan membawa sensasi yang tak terlupakan. Cocok untuk mengisi waktu santai atau menemani nonton film.",
      imagePath: 'assets/spideybites.jpg',
    ),
    Item(
      name: 'Shield Muffin',
      price: 29999,
      description:
          "Shield Muffin adalah pilihan sempurna untuk sarapan yang cepat dan bergizi. Dengan kombinasi rasa blueberry segar dan adonan lembut, muffin ini mengandung serat tinggi untuk menjaga energi Anda sepanjang hari. Ideal untuk memulai hari dengan semangat!",
      imagePath: 'assets/shiledmuffin.jpg',
    ),
    Item(
      name: 'Stark’s Choco Cake',
      price: 30999,
      description:
          "Dapatkan kelezatan cokelat murni dengan Stark’s Choco Cakes! Muffin lembut yang dipenuhi dengan potongan cokelat hitam yang meleleh, membuatnya menjadi camilan manis yang sempurna. Sesuai untuk dinikmati kapan saja, terutama saat Anda butuh sedikit manis dalam hidup.",
      imagePath: 'assets/cake.jpg',
    ),
    Item(
      name: 'Red Smoothies',
      price: 25999,
      description:
          "Red Smoothies adalah kombinasi segar dari buah-buahan merah terbaik, seperti stroberi, raspberry, dan bit. Dibuat dengan bahan alami dan tanpa tambahan gula, smoothies ini tidak hanya lezat, tetapi juga kaya akan vitamin dan antioksidan. Segarkan hari Anda dengan satu gelas penuh nutrisi!",
      imagePath: 'assets/redsmoo.jpg',
    ),
    Item(
      name: 'Ocean Blue',
      price: 25999,
      description:
          "Ocean Blue adalah minuman yang menyegarkan dan menyehatkan, terbuat dari perpaduan kelapa, nanas, dan mint. Setiap tegukan akan membawa Anda ke pantai yang indah, memberikan rasa segar dan dingin. Sempurna untuk dinikmati saat cuaca panas atau setelah berolahraga.",
      imagePath: 'assets/oceanblue.jpg',
    ),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cake List | Jasmine | 2096'),
        backgroundColor: const Color.fromARGB(255, 143, 9, 43),
      ),
      backgroundColor: const Color(0xFFFDF4D3),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/item',
                  arguments: item,
                );
              },
              child: ListTile(
                leading: Hero(
                  tag: item.name, // Unique tag for the Hero animation
                  child: Image.asset(
                    item.imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(item.name),
                subtitle: Text('Harga: ${item.price} IDR'),
              ),
            ),
          );
        },
      ),
    );
  }
}
