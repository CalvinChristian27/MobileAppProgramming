import 'package:flutter/material.dart';

class Transaksi extends StatefulWidget {
  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  int pesanMakan = 0;
  int harga = 10000;
  int totalsemua = 0;


  void nambahMakan(){
    setState(() {
      pesanMakan++;
    });
  }
  void kurangiMakan(){
    setState(() {
      pesanMakan--;
    });
  }
  int totalHarga() {
    totalsemua = pesanMakan * harga;
    return totalsemua;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transaksi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari Riwayat Transaksi',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Filters
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterChip(
                      label: Text("Status Pesanan"),
                      onSelected: (value) {},
                    ),
                    FilterChip(
                      label: Text("Lokasi Kota"),
                      onSelected: (value) {},
                    ),
                    FilterChip(
                      label: Text("Tanggal"),
                      onSelected: (value) {},
                    ),
                  ],
                ),
                SizedBox(height: 24),
                // Keranjang Section
                Text(
                  "Keranjang",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text("Semarang"),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/img/lumpia.png',
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lumpia",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Beku"),
                          Text(
                            'Rp ${totalHarga()}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if(pesanMakan > 0){
                              kurangiMakan();
                            }
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text(pesanMakan.toString()),
                        IconButton(
                          onPressed: () {
                            nambahMakan();
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                // Riwayat Transaksi Section
                Text(
                  "Riwayat Transaksi",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16),
                // Riwayat Card
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/img/kupingajah.png',
                          height: 50,
                          width: 50,
                        ),
                        title: Text(
                          "Kuping Gajah",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("3 Barang"),
                            Text("Rp45.000"),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Diproses",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.more_vert),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}