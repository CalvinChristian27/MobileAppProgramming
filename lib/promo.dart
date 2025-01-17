import 'package:flutter/material.dart';
import 'package:local_treat/promoSaya.dart';

class Promo extends StatefulWidget {
  @override
  State<Promo> createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  final List<Map<String, dynamic>> promos = [
    {"title": "Diskon 20rb untuk pembelian di Semarang", "price": 30},
    {"title": "Diskon 10rb untuk pembelian di Bali", "price": 15},
    {"title": "Diskon 20% untuk pembelian produk terpopuler", "price": 20},
    {"title": "Diskon 25% untuk pembelian di Jakarta", "price": 23},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Koin Anda",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Row(
            children: const [
              Icon(Icons.info_outline, color: Colors.black),
              SizedBox(width: 10),
              Text(
                "10",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(width: 5),
              Icon(Icons.monetization_on, color: Colors.yellow),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab bar
          Container(
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Promo() 
                    ));
                  },
                  child: const Text(
                    "Promo",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PromoSaya()
                    ));
                  },
                  child: const Text(
                    "Promo Saya",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: promos.length,
              itemBuilder: (context, index) {
                final promo = promos[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.image, size: 50),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  promo["title"],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "${promo["price"]}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Icon(Icons.monetization_on, color: Colors.yellow),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
