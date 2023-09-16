import 'package:flutter/material.dart';
import 'package:Policy_Centre_Point/keranjang.dart';
import 'package:Policy_Centre_Point/product.dart';
import 'package:Policy_Centre_Point/view_rekomendasi.dart';
import 'package:Policy_Centre_Point/warna.dart';
import 'package:Policy_Centre_Point/rekomendasi_makanan.dart';

class detail_menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            'MENU FITUR',
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
                Icons.history,
                color: Color(0xFF27FAC7),
              ),
            ),
          ],
          iconTheme: IconThemeData(
            color: Warna.TextBold, // Change the drawer icon color here
          ),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            HomePage(),
            FavoritesPage(),
            SearchPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          unselectedItemColor: Warna.TextBold,
          selectedItemColor: Warna.Primary,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.food_bank_outlined,
              ),
              label: 'Makanan & Minuman',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.store_outlined,
              ),
              label: 'Grosir',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.spa_sharp,
              ),
              label: 'Beauty',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.medication_liquid_outlined,
              ),
              label: 'Apotik',
            ),
          ],
        ),
      ),
    );
  }
}

// Create individual page classes (HomePage, FavoritesPage, SearchPage, ProfilePage) as per your app requirements.
// For this example, let's just create empty containers for each page.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Warna.BG,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /* BAGIAN */
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: TextButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    fixedSize: MaterialStateProperty.all(
                        Size(250, 5)), // Set width and height
                    backgroundColor: MaterialStateProperty.all(
                        Colors.grey.shade50), // Background color
                  ),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  label: Text('Cari layanan, makanan, & tujuan',
                      style: TextStyle(color: Warna.PrimaryDark)),
                ),
              ),
              /* BAGIAN */
              /* BAGIAN */
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(5),
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    //ITEM BAGIAN
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade200)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(children: [
                                Image.asset(
                                  'assets/icon/grocery.png',
                                  width: 40,
                                  height: 40,
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    'GUNAKAN VOUCHER',
                                    style: TextStyle(
                                        color: Warna.TextBold,
                                        fontFamily: 'URW',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ]),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all<Color>(
                                    Warna.PrimaryHalf),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize
                                    .min, // Mengatur agar Row mengambil lebar minimum
                                children: [
                                  Text(
                                    '',
                                    style: TextStyle(
                                      color: Warna
                                          .Primary, // Warna teks tombol saat tombol tidak ditekan
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_circle_right,
                                    color: Warna
                                        .Primary, // Warna ikon saat tombol tidak ditekan
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //ITEM BAGIAN

                    //ITEM BAGIAN
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //MENU PILIHAN
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  //ITEM PILIHAN
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: Image.asset(
                                            'assets/icon/grocery.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Text(
                                            'Terdekat',
                                            style: TextStyle(
                                                fontFamily: 'URW',
                                                color: Warna.TextBold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //ITEM PILIHAN
                                  //ITEM PILIHAN
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: Image.asset(
                                            'assets/icon/grocery.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Text(
                                            'Terbaru',
                                            style: TextStyle(
                                                fontFamily: 'URW',
                                                color: Warna.TextBold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //ITEM PILIHAN
                                  //ITEM PILIHAN
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: Image.asset(
                                            'assets/icon/grocery.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Text(
                                            'Best Seller',
                                            style: TextStyle(
                                                fontFamily: 'URW',
                                                color: Warna.TextBold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //ITEM PILIHAN
                                  //ITEM PILIHAN
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: Image.asset(
                                            'assets/icon/grocery.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Text(
                                            'Terdekat',
                                            style: TextStyle(
                                                fontFamily: 'URW',
                                                color: Warna.TextBold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //ITEM PILIHAN
                                  //ITEM PILIHAN
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: Image.asset(
                                            'assets/icon/grocery.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Text(
                                            'Terdekat',
                                            style: TextStyle(
                                                fontFamily: 'URW',
                                                color: Warna.TextBold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //ITEM PILIHAN
                                ],
                              ),
                            ),
                          ),
                          //MENU PILIHAN
                        ],
                      ),
                    ),
                    //ITEM BAGIAN

                    Divider(),

                    //REKOMENDASI
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'REKOMENDASI KAMU',
                            style: TextStyle(
                                color: Warna.TextBold,
                                fontFamily: 'URW',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => ProductListPage())),
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Warna.PrimaryHalf),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Mengatur agar Row mengambil lebar minimum
                              children: [
                                Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                    color: Warna
                                        .Primary, // Warna teks tombol saat tombol tidak ditekan
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_circle_right,
                                  color: Warna
                                      .Primary, // Warna ikon saat tombol tidak ditekan
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //REKOMENDASI

                    //PRODUK BAR REKOMENDASI
                    //MENU PILIHAN
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  //ITEM REKOMENDASI
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (_) => ProductPage(
                                                  id: '123',
                                                  name: 'KFC nasi Lemak',
                                                ))),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://www.everydayonsales.com/wp-content/uploads/2022/06/KFC-Nasi-Lemak-Deal.jpg',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Text(
                                            'KFC Nasi Lemak',
                                            style: TextStyle(
                                                fontFamily: 'URW',
                                                color: Warna.TextBold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //ITEM REKOMENDASI
                                  //ITEM REKOMENDASI
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://www.everydayonsales.com/wp-content/uploads/2022/06/KFC-Nasi-Lemak-Deal.jpg',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Text(
                                            'KFC Nasi Lemak',
                                            style: TextStyle(
                                                fontFamily: 'URW',
                                                color: Warna.TextBold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //ITEM REKOMENDASI
                                  //ITEM REKOMENDASI
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://www.everydayonsales.com/wp-content/uploads/2022/06/KFC-Nasi-Lemak-Deal.jpg',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Text(
                                            'KFC Nasi Lemak',
                                            style: TextStyle(
                                                fontFamily: 'URW',
                                                color: Warna.TextBold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //ITEM REKOMENDASI
                                  //ITEM REKOMENDASI
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://www.everydayonsales.com/wp-content/uploads/2022/06/KFC-Nasi-Lemak-Deal.jpg',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Text(
                                            'KFC Nasi Lemak',
                                            style: TextStyle(
                                                fontFamily: 'URW',
                                                color: Warna.TextBold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //ITEM REKOMENDASI
                                  //ITEM REKOMENDASI
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://www.everydayonsales.com/wp-content/uploads/2022/06/KFC-Nasi-Lemak-Deal.jpg',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Text(
                                            'KFC Nasi Lemak',
                                            style: TextStyle(
                                                fontFamily: 'URW',
                                                color: Warna.TextBold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //ITEM REKOMENDASI
                                  //ITEM REKOMENDASI
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://www.everydayonsales.com/wp-content/uploads/2022/06/KFC-Nasi-Lemak-Deal.jpg',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Text(
                                            'KFC Nasi Lemak',
                                            style: TextStyle(
                                                fontFamily: 'URW',
                                                color: Warna.TextBold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //ITEM REKOMENDASI
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //MENU PILIHAN
                    //PRODUK BAR REKOMENDASI

                    //ANEKA KULINER
                    Divider(),

                    //KULINER TITLE
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'EKSPLOR ANEKA KULINER',
                            style: TextStyle(
                                color: Warna.TextBold,
                                fontFamily: 'URW',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Warna.PrimaryHalf),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Mengatur agar Row mengambil lebar minimum
                              children: [
                                Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                    color: Warna
                                        .Primary, // Warna teks tombol saat tombol tidak ditekan
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_circle_right,
                                  color: Warna
                                      .Primary, // Warna ikon saat tombol tidak ditekan
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //KULINER TITLE

                    //MENU PILIHAN
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'Terdekat',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'Terbaru',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'Best Seller',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'Terdekat',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //MENU PILIHAN

                    //ANEKA KULINER
                  ],
                ),
              ),
              /* BAGIAN */
            ],
          ),
        ),
      ),
    );
  }
}

//KEDUA
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Warna.BG,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /* BAGIAN */
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: TextButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    fixedSize: MaterialStateProperty.all(
                        Size(250, 5)), // Set width and height
                    backgroundColor: MaterialStateProperty.all(
                        Colors.grey.shade50), // Background color
                  ),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  label: Text('Cari layanan, makanan, & tujuan',
                      style: TextStyle(color: Warna.PrimaryDark)),
                ),
              ),
              /* BAGIAN */
              /* BAGIAN */
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(5),
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Divider(),

                    //REKOMENDASI
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              Text(
                                'TERDEKAT',
                                style: TextStyle(
                                    color: Warna.TextBold,
                                    fontFamily: 'URW',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Warna.PrimaryHalf),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Mengatur agar Row mengambil lebar minimum
                              children: [
                                Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                    color: Warna
                                        .Primary, // Warna teks tombol saat tombol tidak ditekan
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_circle_right,
                                  color: Warna
                                      .Primary, // Warna ikon saat tombol tidak ditekan
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //REKOMENDASI

                    //BAR TERDEKAT
                    //MENU PILIHAN
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://mutiaragemilang.id/wp-content/uploads/2023/03/es-krim-di-indomaret.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'INDOMARET',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/ALFAMART_LOGO_BARU.png/1200px-ALFAMART_LOGO_BARU.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'ALFAMART',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://mutiaragemilang.id/wp-content/uploads/2023/03/es-krim-di-indomaret.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'INDOMARET',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://mutiaragemilang.id/wp-content/uploads/2023/03/es-krim-di-indomaret.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'INDOMARET',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://mutiaragemilang.id/wp-content/uploads/2023/03/es-krim-di-indomaret.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'INDOMARET',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //MENU PILIHAN
                    //BAR TERDEKAT

                    //ANEKA KULINER
                    Divider(),

                    //KULINER TITLE
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SELURUH TOKO GROSIR',
                            style: TextStyle(
                                color: Warna.TextBold,
                                fontFamily: 'URW',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Warna.PrimaryHalf),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Mengatur agar Row mengambil lebar minimum
                              children: [
                                Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                    color: Warna
                                        .Primary, // Warna teks tombol saat tombol tidak ditekan
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_circle_right,
                                  color: Warna
                                      .Primary, // Warna ikon saat tombol tidak ditekan
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //KULINER TITLE

                    //MENU PILIHAN
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'TOKO 1',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'TOKO 2',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'TOKO 3',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'TOKO 4',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //MENU PILIHAN

                    //ANEKA KULINER
                  ],
                ),
              ),
              /* BAGIAN */
            ],
          ),
        ),
      ),
    );
  }
}
//KEDUA

//BEAUTY
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Warna.BG,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /* BAGIAN */
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: TextButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    fixedSize: MaterialStateProperty.all(
                        Size(250, 5)), // Set width and height
                    backgroundColor: MaterialStateProperty.all(
                        Colors.grey.shade50), // Background color
                  ),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  label: Text('Cari layanan, makanan, & tujuan',
                      style: TextStyle(color: Warna.PrimaryDark)),
                ),
              ),
              /* BAGIAN */
              /* BAGIAN */
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(5),
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Divider(),

                    //REKOMENDASI
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              Text(
                                'TERDEKAT',
                                style: TextStyle(
                                    color: Warna.TextBold,
                                    fontFamily: 'URW',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Warna.PrimaryHalf),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Mengatur agar Row mengambil lebar minimum
                              children: [
                                Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                    color: Warna
                                        .Primary, // Warna teks tombol saat tombol tidak ditekan
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_circle_right,
                                  color: Warna
                                      .Primary, // Warna ikon saat tombol tidak ditekan
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //REKOMENDASI

                    //BAR TERDEKAT
                    //MENU PILIHAN
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://mutiaragemilang.id/wp-content/uploads/2023/03/es-krim-di-indomaret.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'INDOMARET',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/ALFAMART_LOGO_BARU.png/1200px-ALFAMART_LOGO_BARU.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'ALFAMART',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://mutiaragemilang.id/wp-content/uploads/2023/03/es-krim-di-indomaret.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'INDOMARET',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://mutiaragemilang.id/wp-content/uploads/2023/03/es-krim-di-indomaret.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'INDOMARET',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://mutiaragemilang.id/wp-content/uploads/2023/03/es-krim-di-indomaret.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'INDOMARET',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //MENU PILIHAN
                    //BAR TERDEKAT

                    //ANEKA KULINER
                    Divider(),

                    //KULINER TITLE
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SELURUH TOKO GROSIR',
                            style: TextStyle(
                                color: Warna.TextBold,
                                fontFamily: 'URW',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Warna.PrimaryHalf),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Mengatur agar Row mengambil lebar minimum
                              children: [
                                Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                    color: Warna
                                        .Primary, // Warna teks tombol saat tombol tidak ditekan
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_circle_right,
                                  color: Warna
                                      .Primary, // Warna ikon saat tombol tidak ditekan
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //KULINER TITLE

                    //MENU PILIHAN
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'TOKO 1',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'TOKO 2',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'TOKO 3',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'TOKO 4',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //MENU PILIHAN

                    //ANEKA KULINER
                  ],
                ),
              ),
              /* BAGIAN */
            ],
          ),
        ),
      ),
    );
  }
}
//BEAUTY

//APOTEK
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Warna.BG,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /* BAGIAN */
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: TextButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    fixedSize: MaterialStateProperty.all(
                        Size(250, 5)), // Set width and height
                    backgroundColor: MaterialStateProperty.all(
                        Colors.grey.shade50), // Background color
                  ),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  label: Text('Cari layanan, makanan, & tujuan',
                      style: TextStyle(color: Warna.PrimaryDark)),
                ),
              ),
              /* BAGIAN */
              /* BAGIAN */
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(5),
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Divider(),

                    //REKOMENDASI
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              Text(
                                'TERDEKAT',
                                style: TextStyle(
                                    color: Warna.TextBold,
                                    fontFamily: 'URW',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Warna.PrimaryHalf),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Mengatur agar Row mengambil lebar minimum
                              children: [
                                Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                    color: Warna
                                        .Primary, // Warna teks tombol saat tombol tidak ditekan
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_circle_right,
                                  color: Warna
                                      .Primary, // Warna ikon saat tombol tidak ditekan
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //REKOMENDASI

                    //BAR TERDEKAT
                    //MENU PILIHAN
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: <Widget>[
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://mutiaragemilang.id/wp-content/uploads/2023/03/es-krim-di-indomaret.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'INDOMARET',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/ALFAMART_LOGO_BARU.png/1200px-ALFAMART_LOGO_BARU.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'ALFAMART',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://mutiaragemilang.id/wp-content/uploads/2023/03/es-krim-di-indomaret.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'INDOMARET',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://mutiaragemilang.id/wp-content/uploads/2023/03/es-krim-di-indomaret.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'INDOMARET',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                  //ITEM TERDEKAT
                                  TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all<
                                              Color>(
                                          Color.fromARGB(255, 252, 237, 241)),
                                    ),
                                    onPressed: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey.shade300)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              'https://mutiaragemilang.id/wp-content/uploads/2023/03/es-krim-di-indomaret.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 16,
                                                  ),
                                                  Text("5Km")
                                                ],
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(5),
                                                child: Text(
                                                  'INDOMARET',
                                                  style: TextStyle(
                                                      fontFamily: 'URW',
                                                      color: Warna.TextBold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //ITEM TERDEKAT
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //MENU PILIHAN
                    //BAR TERDEKAT

                    //ANEKA KULINER
                    Divider(),

                    //KULINER TITLE
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SELURUH TOKO GROSIR',
                            style: TextStyle(
                                color: Warna.TextBold,
                                fontFamily: 'URW',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Warna.PrimaryHalf),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Mengatur agar Row mengambil lebar minimum
                              children: [
                                Text(
                                  'Lihat Semua',
                                  style: TextStyle(
                                    color: Warna
                                        .Primary, // Warna teks tombol saat tombol tidak ditekan
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_circle_right,
                                  color: Warna
                                      .Primary, // Warna ikon saat tombol tidak ditekan
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //KULINER TITLE

                    //MENU PILIHAN
                    Container(
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'TOKO 1',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'TOKO 2',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'TOKO 3',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                    //ITEM PILIHAN
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateProperty.all<
                                                Color>(
                                            Color.fromARGB(255, 252, 237, 241)),
                                      ),
                                      onPressed: () {},
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Warna.PrimaryHalf,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color:
                                                        Colors.grey.shade300)),
                                            child: Image.asset(
                                              'assets/icon/grocery.png',
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            child: Text(
                                              'TOKO 4',
                                              style: TextStyle(
                                                  fontFamily: 'URW',
                                                  color: Warna.TextBold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //ITEM PILIHAN
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //MENU PILIHAN

                    //ANEKA KULINER
                  ],
                ),
              ),
              /* BAGIAN */
            ],
          ),
        ),
      ),
    );
  }
}
//APOTEK
