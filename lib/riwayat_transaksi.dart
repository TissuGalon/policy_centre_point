import 'package:flutter/material.dart';
import 'package:Policy_Centre_Point/warna.dart';

void main() {
  runApp(riwayat_transaksi());
}

class riwayat_transaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF222222),
            ),
          ),
          title: Text(
            'RIWAYAT TRANSAKSI',
            style: TextStyle(
                color: Warna.TextBold,
                fontFamily: 'URW',
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          actions: [
            // Navigate to the Search Screen
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.history,
                color: Color(0xFF222222),
              ),
            ),
          ],
          iconTheme: IconThemeData(
            color: Warna.TextBold, // Change the drawer icon color here
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Warna.BG),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text(
                  '',
                  style: TextStyle(
                      fontFamily: 'URW',
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'RIWAYAT TRANSAKSI',
                      style: TextStyle(
                          color: Warna.Primary,
                          fontFamily: 'URW',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  background: Container(
                    decoration: BoxDecoration(color: Warna.Primary),
                    child: Image.network(
                        'https://cdni.iconscout.com/illustration/premium/thumb/online-transaction-report-3323732-2791561.png?f=webp'),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 8,
                  (context, index) {
                    return ListTile(
                      title: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            left: 0, right: 0, top: 0, bottom: 0),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://nos.jkt-1.neo.id/mcdonalds/foods/October2019/9FcgMqqWSFYjE6edaOAL.png',
                                      width: 80,
                                      height: 80,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Burger Cheesee Egg',
                                          style: TextStyle(
                                              fontFamily: 'URW',
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Warna.TextBold),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.store,
                                              size: 16,
                                              color: Warna.TextNormal,
                                            ),
                                            Text(
                                              'MacDonalds',
                                              style: TextStyle(
                                                  color: Warna.TextNormal),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Rp. 24.000',
                                          style: TextStyle(
                                              fontFamily: 'URW',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Warna.Primary),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '2 Agustus 2023',
                                      style: TextStyle(
                                          fontFamily: 'URW',
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey.shade600),
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Warna.Primary),
                                        ),
                                        child: Text(
                                          'Beli Lagi',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'URW',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
