import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
Widget build(BuildContext context) {
  final Item item = ModalRoute.of(context)!.settings.arguments as Item;

  Widget titleSection = Container(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Text(
                'Harga: ${item.price} IDR',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.shopping_cart,
          color: Colors.red[500],
        ),
        const Text('1'),
      ],
    ),
  );

  Column buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Color color = Theme.of(context).primaryColor;

  Widget buttonSection = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildButtonColumn(color, Icons.favorite, 'Wishlist'),
      buildButtonColumn(color, Icons.star, 'Rate Item'),
      buildButtonColumn(color, Icons.comment, 'Comment'),
    ],
  );

  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      item.description,
      softWrap: true,
      style: const TextStyle(fontSize: 16),
    ),
  );

  return Scaffold(
    appBar: AppBar(
      title: Text(item.name),
      backgroundColor: const Color.fromARGB(255, 143, 9, 43),
    ),
    backgroundColor: const Color(0xFFFDF4D3),
    body: ListView(
      children: [
        Image.asset(
          item.imagePath, 
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        titleSection,
        buttonSection,
        textSection,
      ],
    ),
  );
}
}