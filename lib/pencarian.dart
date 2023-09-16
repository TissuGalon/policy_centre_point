import 'package:flutter/material.dart';
import 'package:Policy_Centre_Point/warna.dart';

/// Flutter code sample for [TextField].

class pencarian extends StatelessWidget {
  const pencarian({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Warna.BG,
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
            'PENCARIAN',
            style: TextStyle(
                color: Color(0xFF27FAC7),
                fontFamily: 'URW',
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          actions: [],
          iconTheme: IconThemeData(
            color: Warna.TextBold, // Change the drawer icon color here
          ),
        ),
        body: Center(
          child: Column(
            children: [
              //SEARCH BAR
              Container(
                margin: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    iconColor: Warna.Primary,
                    labelText: 'Cari layanan, makanan & tujuan',
                    icon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Warna.Primary),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Warna.Primary), // Focused Border Color
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              //SEARCH BAR
              //HISTORY BAR
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'PERNAH KAMU CARI',
                      style: TextStyle(
                          fontFamily: 'URW',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Warna.TextBold),
                    ),
                  ),
                  Row(
                    children: [
                      /* HISTORY ITEM */
                      Container(
                        margin: EdgeInsets.all(3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'History 1',
                              style: TextStyle(color: Warna.Primary),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey.shade100,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'History 1',
                              style: TextStyle(color: Warna.Primary),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey.shade100,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'History 1',
                              style: TextStyle(color: Warna.Primary),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey.shade100,
                            ),
                          ),
                        ),
                      ),
                      /* HISTORY ITEM */
                    ],
                  )
                ]),
              ),
              //HISTORY BAR
              //POPULER BAR
              Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'PENCARIAN POPULER',
                      style: TextStyle(
                          fontFamily: 'URW',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Warna.TextBold),
                    ),
                  ),
                  Row(
                    children: [
                      /* HISTORY ITEM */
                      Container(
                        margin: EdgeInsets.all(3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'History 1',
                              style: TextStyle(color: Warna.Primary),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey.shade100,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'History 1',
                              style: TextStyle(color: Warna.Primary),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey.shade100,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'History 1',
                              style: TextStyle(color: Warna.Primary),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey.shade100,
                            ),
                          ),
                        ),
                      ),
                      /* HISTORY ITEM */
                    ],
                  )
                ]),
              ),
              //POPULER BAR
            ],
          ),
        ),

        /* Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            children: <Widget>[
              // Your content goes here
              ListTile(
                title: Center(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        iconColor: Warna.Primary,
                        labelText: 'Cari layanan, makanan & tujuan',
                        icon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Warna.Primary),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Warna.Primary), // Focused Border Color
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Item 2'),
              ),
              ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Item 3'),
              ),
              // Add more items as needed
            ],
          ),
        ), */
      ),
    );
  }
}

void main() => runApp(const pencarian());
