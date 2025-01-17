import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:local_treat/cart.dart';
import 'package:local_treat/dashboardToKota.dart';
import 'package:local_treat/promo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String price;
  final String rating;
  final String reviews;

  const ProductCard({
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    required this.reviews,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(location, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 5),
                Text(price, style: TextStyle(color: Colors.green)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 5),
                    Text('$rating ($reviews)'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardState extends State<Dashboard> {
  int indexSlider = 0;

  final imagesSlider = [
    'assets/img/image.jpg',
    'assets/img/image1.jpg',
    'assets/img/image2.jpg',
    'assets/img/image3.jpg',
    // 'assets/img/image4.jpg',
    // 'assets/img/image5.jpg',
    // 'assets/img/image6.jpg',
    // 'assets/img/image7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            top: 15, 
            left: 10
          ),
          child: GestureDetector(
            onTap: (){
              // fungsi drop down + google maps
            },
            child: Text('Lokasi', style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          )
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 14),
            child: IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => CartPage()
                ));
              }, 
              icon: Image.asset('assets/icons/Cart.png')
            ),
          ),
        ],
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextField(
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
                      hintText: ('Kue apa yang kamu inginkan'),
                    ),
                  ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider.builder(
                    itemCount: imagesSlider.length,
                    itemBuilder: (context, index, realIndex){
                      final imagesEvents = imagesSlider[index];
                      return buildImage(imagesEvents, index);
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 300,
                      onPageChanged: (index, reason) =>
                      setState(() {
                        indexSlider = index;
                      }),
                    ),
                  ),
                  SizedBox(height: 5),
                  buildIndicator(),

                  Row(
                    children: [
                      
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return MacamKota();
                            }
                          ));
                        },
                        child: Ink.image(
                          image: AssetImage('assets/img/Group6.png'),
                          height: 170,
                          width: 170,
                          fit: BoxFit.contain,
                        )
                      ),

                      Spacer(),

                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return Promo();
                            }
                          ));
                        },
                        child: Ink.image(
                          image: AssetImage('assets/img/Group7.png'),
                          height: 170,
                          width: 170,
                          // fit: BoxFit.contain,
                        )
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Produk Populer',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            image: 'assets/img/lumpia.png',
                            title: "Lumpia",
                            location: "Semarang",
                            price: "Rp20.000",
                            rating: "4.7",
                            reviews: "1rb+",
                          );
                        },
                      ),
                    ],
                  ),
                ],
            
              ),
            )
          ),
        ],
      )

    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    effect: ExpandingDotsEffect(
      dotWidth: 15,
      activeDotColor: const Color.fromARGB(255, 78, 225, 83),
      dotColor: const Color.fromARGB(255, 221, 218, 218),
    ),
    activeIndex: indexSlider,
    count: imagesSlider.length,
  );

  Widget buildImage(String imagesSlider, int index) =>
  Container(
    margin: EdgeInsets.symmetric(horizontal: 7),
    child: Image.asset(imagesSlider, fit:BoxFit.contain),
  );
}