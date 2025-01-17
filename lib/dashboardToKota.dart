import 'package:flutter/material.dart';

class MacamKota extends StatelessWidget {
  
  List<String> listKota = [
    'assets/img/bali.png',
    'assets/img/balikpapan.png',
    'assets/img/batam.png',
    'assets/img/betawi.png',
    'assets/img/bogor.png',
    'assets/img/kudus.png',
    'assets/img/lombok.png',
    'assets/img/makassar.png',
    'assets/img/malang.png',
    'assets/img/manado.png',
    'assets/img/medan.png',
    'assets/img/padang.png',
    'assets/img/palembang.png',
    'assets/img/pasuruan.png',
    'assets/img/semarang.png',
    'assets/img/solo.png',
    'assets/img/yogyakarta.png',
    'assets/img/bali.png',
    'assets/img/balikpapan.png',
    'assets/img/batam.png',
    'assets/img/betawi.png',
    'assets/img/bogor.png',
    'assets/img/kudus.png',
    'assets/img/lombok.png',
    'assets/img/makassar.png',
    'assets/img/malang.png',
    'assets/img/manado.png',
    'assets/img/medan.png',
    'assets/img/padang.png',
    'assets/img/palembang.png',
    'assets/img/pasuruan.png',
    'assets/img/semarang.png',
    'assets/img/solo.png',
    'assets/img/yogyakarta.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kota', style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      ),

      body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
            
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 220, 211, 211)
                        )
                  ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                      hintText: ('Cari nama kota'),
                    ),
                ),

                Expanded(
                  child: GridView.builder(
                  itemCount: listKota.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(listKota[index]),
                          fit: BoxFit.contain,
                          )
                        ),
                      );
                    }
                  ),
                ),
              ],
            ),
          )
    );
  }
}