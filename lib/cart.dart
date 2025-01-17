import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Semarang Section
                _buildLocationSection(
                  context,
                  title: "Semarang",
                  items: [
                    _buildCartItem(
                      image: 'assets/img/lumpia.png',
                      name: 'Lumpia',
                      price: 60000,
                      quantity: 3,
                      unit: 'Beku',
                    ),
                    _buildCartItem(
                      image: 'assets/img/kupingajah.png',
                      name: 'Wingko Babat',
                      price: 24500,
                      quantity: 1,
                      unit: 'Toples',
                    ),
                  ],
                ),
                // Bandung Section
                _buildLocationSection(
                  context,
                  title: "Bandung",
                  items: [
                    _buildCartItem(
                      image: 'assets/img/kupingajah.png',
                      name: 'Tahu Bandung',
                      price: 24500,
                      quantity: 1,
                      unit: 'Kemasan',
                    ),
                  ],
                ),
                // Produk Tidak Tersedia Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Produk Tidak Tersedia',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _buildUnavailableProduct('assets/img/lumpia.png'),
                          _buildUnavailableProduct('assets/img/lumpia.png'),
                          _buildUnavailableProduct('assets/img/lumpia.png'),
                        ],
                      ),
                    ],
                  ),
                ),
                // Rekomendasi Lainnya Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rekomendasi Lainnya',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 2 / 3,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return _buildRecommendationItem();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bottom Section
          _buildBottomBar(context, totalPrice: 84500),
        ],
      ),
    );
  }

  Widget _buildLocationSection(BuildContext context, {required String title, required List<Widget> items}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Lihat lainnya'),
              ),
            ],
          ),
          Column(children: items),
        ],
      ),
    );
  }

  Widget _buildCartItem({
    required String image,
    required String name,
    required int price,
    required int quantity,
    required String unit,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(value: true, onChanged: (value) {}),
          Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text(unit, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Text('Rp${price.toString()}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {},
              ),
              Text('$quantity'),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUnavailableProduct(String image) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
    );
  }

  Widget _buildRecommendationItem() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset('assets/img/kupingajah.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kuping Gajah',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Rp15.000',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, {required int totalPrice}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              const Text('Pilih Semua'),
            ],
          ),
          Row(
            children: [
              Text(
                'Total Harga: Rp${totalPrice.toString()}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Beli'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
