// product_detail_page.dart
import 'package:flutter/material.dart';
import 'package:Policy_Centre_Point/warna.dart';

class ProductPage extends StatelessWidget {
  final String id;
  final String name;
  ProductPage({required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Warna.Primary,
        centerTitle: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back, 
            color: Color(0xFF27FAC7),
          ),
        ),
        title: Text(
          'PRODUCT PAGE',
          style: TextStyle(
              color: Warna.Secondary,
              fontFamily: 'URW',
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        actions: [
          // Navigate to the Search Screen
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_basket_outlined,
              color: Color(0xFF27FAC7),
            ),
          ),
        ],
        iconTheme: IconThemeData(
          color: Warna.TextBold, // Change the drawer icon color here
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://cdn.dribbble.com/users/1787323/screenshots/11229539/shipping_delivery-03.png',
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.parallax,
              centerTitle: true,
              title: Container(
                decoration: BoxDecoration(color: Colors.transparent),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(''),
                        SizedBox(
                          width: 100,
                          height: 25,
                          child: TextButton.icon(
                            style: ButtonStyle(
                                iconSize: MaterialStatePropertyAll(10),
                                backgroundColor:
                                    MaterialStatePropertyAll(Warna.Primary),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                            label: Text(
                              'Ganti Background',
                              style: TextStyle(fontSize: 10, fontFamily: 'URW'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Card(
                  color: Colors.white,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 2),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontFamily: 'URW',
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rp. 20.000,00',
                          style: TextStyle(
                              fontFamily: 'URW',
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Warna.Primary),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {},
                                ),
                                Text('5',
                                    style: TextStyle(
                                        color: Warna.Primary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'URW')),
                                IconButton(
                                    icon: Icon(Icons.add), onPressed: () {}),
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.add_shopping_cart_rounded),
                                label: Text('Tambahkan ke Keranjang'),
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color(0xFFFA275A),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Card(
                  color: Colors.white,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 2),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tentang Produk',
                          style: TextStyle(
                              fontFamily: 'URW',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi, repellendus. Minima, nam amet odio rerum aliquam delectus corporis autem ex soluta illum nisi? Animi at suscipit delectus? Nobis, exercitationem rem. ',
                            style: TextStyle(
                                fontFamily: 'URW',
                                fontSize: 15,
                                color: Warna.TextNormal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Card(
                  color: Colors.white,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin:
                      EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 2),
                  child: Row(
                    children: [
                      SizedBox(height: 16),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/images/me.jpeg'),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NAMA TOKO',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'URW',
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'ALAMAT',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'URW',
                                      color: Warna.TextNormal),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Card(
                  color: Colors.white,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Berikan Ulasan Anda',
                          style: TextStyle(
                              fontFamily: 'URW',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        TextField(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Kirim Ulasan",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Warna.Primary)),
                        ),
                      ],
                    ),
                  ),
                ),

                // Add more profile details here
                // For example, bio, interests, posts, etc.
                // Extra space for demonstration
                /* SizedBox(height: 300), */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
