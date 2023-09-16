import 'package:Policy_Centre_Point/proses/register_page.dart';
import 'package:Policy_Centre_Point/proses/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:Policy_Centre_Point/detail_acara.dart';
import 'package:Policy_Centre_Point/keranjang.dart';
import 'package:Policy_Centre_Point/notifikasi.dart';
import 'package:Policy_Centre_Point/warna.dart';
import 'package:Policy_Centre_Point/pencarian.dart';
import 'package:Policy_Centre_Point/riwayat_transaksi.dart';
import 'package:Policy_Centre_Point/detail_menu.dart';
import 'package:Policy_Centre_Point/detail_acara.dart';
import 'package:Policy_Centre_Point/proses/intro_page.dart';
/* -- */
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  //HALAMAN WELCOME
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  //HALAMAN WELCOME
  //STATUSBAR WARNA
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // Replace this with your desired color
    statusBarBrightness:
        Brightness.light, // Change this to change text color of status bar
  ));
  //STATUSBAR WARNA
  runApp(MainPage(isFirstLaunch));
}

class MainPage extends StatelessWidget {
  final bool isFirstLaunch;

  MainPage(this.isFirstLaunch);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Policy Centre Point',
      home: isFirstLaunch ? IntroPage() : HomePage(),
    );
  }
}

//WELCOME SCREEN
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 30), // AddRing space at the top
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('isFirstLaunch', false);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                    fontSize: 18, fontFamily: 'URW', color: Warna.Primary),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/welcome_page/welcome.png'),
                  Text(
                    'Welcome to Policy Centre Point!',
                    style: TextStyle(
                      fontFamily: 'URW',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Text(
                      'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Aspernatur sequi, repellat placeat iure eius dicta temporibus. Repellat provident, qui,',
                      style: TextStyle(fontSize: 16, color: Warna.TextNormal),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 200.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool('isFirstLaunch', false);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontFamily: 'URW', fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Warna.Primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 32.0),
                        textStyle: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'URW',
                          color: Warna.Primary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//WELCOME SCREEN

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HalamanUtama(),
    DaftarAcara(),
    ScanQR(),
    FourthPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna.BG,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          children: [
            Image.asset(
              'assets/images/policy2.png',
              width: 30,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'POLICY CENTRE POINT',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'URW',
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
          ],
        ),
        actions: [
          // Navigate to the Search Screen
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => keranjang())),
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
        iconTheme: IconThemeData(
          color: Warna.TextBold, // Change the drawer icon color here
        ),
      ),

      //SIDEBAR
      drawer: SideBar(),
      //SIDEBAR
      body: _pages[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.red,
          unselectedItemColor: Warna.TextBold,
          selectedItemColor: Warna.Primary,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note),
              label: 'Daftar Acara',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'Absen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_ind),
              label: 'Pengurus',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

//HALAMAN PERTAMA
class HalamanUtama extends StatelessWidget {
  //IMAGE URL
  final List<String> imageUrls = [
    'https://unblast.com/wp-content/uploads/2020/03/Illustrator-Vector-Illustration-1.jpg',
    'https://media.istockphoto.com/id/1139913278/vector/woman-with-laptop-sitting-in-nature-and-leaves-concept-illustration-for-working-freelancing.jpg?s=612x612&w=0&k=20&c=Uox6lJYdis3DmG3qdP8x06q4WZdVKSUR8LyL6O3-TWo=',
    'https://img.freepik.com/premium-vector/concept-teamwork-pair-people-collecting-organizing-abstract-geometric-shapes-scattered-around-them-man-woman-holding-circles-flat-style-contemporary-cartoon-illustration-web_126608-373.jpg',
    // Add more image URLs here
  ];
  //IMAGE URL

  @override
  Widget build(BuildContext context) {
    return Container(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.

      child: SingleChildScrollView(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const pencarian())),
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
                    label:
                        Text('Pencarian', style: TextStyle(color: Colors.grey)),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => notifikasi())),
                        icon: const Icon(
                          Icons.notifications,
                          color: Color.fromARGB(255, 250, 187, 39),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //CAROUSEL
            Container(
              margin: EdgeInsets.only(top: 1.0, left: 5, right: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 175, // Set the height of the carousel
                    aspectRatio: 16 / 9, // Set the aspect ratio of the carousel
                    autoPlay:
                        true, // Set auto-play to true for automatic sliding
                    enlargeCenterPage:
                        true, // Set to true for the center item to be larger
                  ),
                  items: imageUrls.map((url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 0),
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            //CAROUSEL

            //WALLET BAR
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Container(
                margin:
                    EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.monetization_on_outlined,
                          size: 20,
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            '2000',
                            style: TextStyle(
                                color: Warna.Primary,
                                fontFamily: 'URW',
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'Coin',
                          style: TextStyle(
                              color: Warna.TextBold,
                              fontFamily: 'URW',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Rp. ',
                          style: TextStyle(
                              color: Warna.TextBold,
                              fontFamily: 'URW',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            '150.000',
                            style: TextStyle(
                                fontFamily: 'URW',
                                color: Warna.Primary,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(
                          Icons.account_balance_wallet_rounded,
                          size: 20,
                          color: Warna.TextNormal,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            //WALLET BAR

            //LEVEL BAR
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              child: TextButton(
                onPressed: () {
                  // Add your button press logic here
                  print('Button pressed!');
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Border radius
                  ),
                  backgroundColor: Colors.white,
                  primary: Colors.white, // Set the text color to orange
                ),
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/me.jpeg'),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'MUHAMMAD KHOLIS',
                                  style: TextStyle(
                                      fontFamily: 'URW',
                                      fontSize: 18,
                                      color: Warna.TextBold,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Member',
                                      style: TextStyle(
                                          fontFamily: 'URW',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Warna.Primary),
                                    ),
                                    Text(
                                      '•',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 5, right: 5),
                                      child: Text(
                                        '1000',
                                        style: TextStyle(color: Warna.Primary),
                                      ),
                                    ),
                                    Text(
                                      'Poin',
                                      style: TextStyle(color: Warna.TextNormal),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Warna.Primary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //LEVEL BAR

            SizedBox(
              height: 10,
            ),

            //DISINI
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CellWidget(
                          firstLineGambar: 'assets/icon/member.png',
                          secondLineText: 'ALL MEMBERS',
                        ),
                      ),
                      /* Expanded(
                        child: CellWidget(
                          firstLineGambar: 'assets/icon/grocery.png',
                          secondLineText: 'Produk Grosir',
                        ),
                      ), */
                      Expanded(
                        child: CellWidget(
                          firstLineGambar: 'assets/icon/date.png',
                          secondLineText: 'ACARA',
                        ),
                      ),
                      Expanded(
                        child: CellWidget(
                          firstLineGambar: 'assets/icon/khas.png',
                          secondLineText: 'UANG KHAS',
                        ),
                      ),
                    ],
                  ),
                  /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CellWidget(
                        firstLineGambar: 'assets/images/me.jpeg',
                        secondLineText: 'Line 2 Text',
                      ),
                    ),
                    Expanded(
                      child: CellWidget(
                        firstLineGambar: 'assets/images/me.jpeg',
                        secondLineText: 'Line 2 Text',
                      ),
                    ),
                    Expanded(
                      child: CellWidget(
                        firstLineGambar: 'assets/images/me.jpeg',
                        secondLineText: 'Line 2 Text',
                      ),
                    ),
                    Expanded(
                      child: CellWidget(
                        firstLineGambar: 'assets/images/me.jpeg',
                        secondLineText: 'Line 2 Text',
                      ),
                    ),
                  ],
                ), */
                ],
              ),
            ),

            //RIWAYAT TRANSAKSI
            Container(
              margin: EdgeInsets.only(top: 10, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'DAFTAR ACARA ANDA',
                    style: TextStyle(
                        color: Warna.TextBold,
                        fontFamily: 'URW',
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => riwayat_transaksi()));
                    },
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all<Color>(Warna.PrimaryHalf),
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

            //ITEM ACARA

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {},
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        child: Row(
                          children: [
                            FittedBox(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://ftp.ukmpolicy.org/wp-content/uploads/2023/01/cropped-L-Tanpa-T.png',
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FittedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Festival Technology Policy',
                                    style: TextStyle(
                                        fontFamily: 'URW',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Warna.TextBold),
                                  ),
                                  Text(
                                    'Sedang Berlangsung',
                                    style: TextStyle(
                                        fontFamily: 'URW',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Warna.Primary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FittedBox(
                        child: Column(
                          children: [
                            Text(
                              '2 Agustus 2023',
                              style: TextStyle(
                                  fontFamily: 'URW',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey.shade600),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => Detail_Acara(
                                            id: '123',
                                            nama_acara:
                                                'Festival Technology Policy',
                                            status: 'Berlangsung',
                                          ))),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Warna.Primary),
                              ),
                              child: const Text(
                                'Lihat Acara',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'URW',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //ITEM ACARA

            //RIWAYAT TRANSAKSI

            //DISINI

            //DISINI

            //DISINI

            //DISINI
          ],
        ),
      ),
    );
  }
}

class CellWidget extends StatelessWidget {
  final String firstLineGambar;
  final String secondLineText;

  CellWidget({
    required this.firstLineGambar,
    required this.secondLineText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                firstLineGambar, // Replace with your image path
                width: 50,
                height: 50,
              ),
              SizedBox(height: 10),
              Text(
                secondLineText,
                style: TextStyle(
                    fontSize: 14,
                    color: Warna.TextBold,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'URW'),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//HALAMAN PERTAMA

//HALAMAN KEDUA
class MenuItem {
  final String title;
  final String status;
  final String gambar;
  final String id;

  MenuItem({
    required this.title,
    required this.status,
    required this.gambar,
    required this.id,
  });
}

class DaftarAcara extends StatefulWidget {
  @override
  _DaftarAcaraState createState() => _DaftarAcaraState();
}

class _DaftarAcaraState extends State<DaftarAcara> {
  late Future<List<MenuItem>> menuItemsFuture;
  int displayedItemsCount = 7; // Initially display 7 items

  @override
  void initState() {
    super.initState();
    menuItemsFuture = fetchMenuItems();
  }

  Future<List<MenuItem>> fetchMenuItems() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<MenuItem> menuItems = data.map((item) {
        return MenuItem(
          title: item['title'].toString(),
          status: item['id'].toString(),
          gambar: item['thumbnailUrl'].toString(),
          id: item['id'].toString(),
        );
      }).toList();
      return menuItems;
    } else {
      throw Exception('Failed to load menu items');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          'DAFTAR ACARA',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        child: FutureBuilder<List<MenuItem>>(
          future: menuItemsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ShimmerList(); // Display shimmer loading effect
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: displayedItemsCount <= snapshot.data!.length
                    ? displayedItemsCount
                    : snapshot.data!.length,
                itemBuilder: (context, index) {
                  if (index == displayedItemsCount - 1 &&
                      index < snapshot.data!.length - 1) {
                    return Column(
                      children: [
                        MenuItemCard(menuItem: snapshot.data![index]),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Warna.Primary)),
                          onPressed: () {
                            setState(() {
                              displayedItemsCount +=
                                  7; // Increase displayed count
                            });
                          },
                          child: Text('Muat lebih banyak'),
                        ),
                      ],
                    );
                  } else {
                    return MenuItemCard(menuItem: snapshot.data![index]);
                  }
                },
              );
            } else {
              return Text('Tidak ada data tersedia.');
            }
          },
        ),
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.white,
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 16,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        width: 100,
                        height: 12,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;

  MenuItemCard({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        onPressed: () {
          print(menuItem.id);
        },
        child: ListTile(
          leading: Image.network(menuItem.gambar),
          title: Text(
            menuItem.title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            menuItem.status,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
//HALAMAN KEDUA

//HALAMAN SCAN
class ScanQR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //ITEM ABSEN
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => detail_menu()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/member.png', // Replace with your image path
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'ABSEN RUANG SEKRET',
                          style: TextStyle(
                              fontSize: 14,
                              color: Warna.TextBold,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'URW'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //ITEM ABSEN
              //ITEM ABSEN
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => detail_menu()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/member.png', // Replace with your image path
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'ABSEN RUANG SEKRET',
                          style: TextStyle(
                              fontSize: 14,
                              color: Warna.TextBold,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'URW'),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //ITEM ABSEN
            ],
          )
        ],
      ),
    );
  }
}
//HALAMAN SCAN

//HALAMAN PENGURUS
class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Halaman Pengurus'),
    );
  }
}
//HALAMAN PENGURUS

//HALAMAN PROFIL
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna.BG,
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
                  child: Row(
                    children: [
                      SizedBox(height: 16),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/me.jpeg'),
                        ),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MUHAMMAD KHOLIS',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'URW',
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '085161787501',
                                  style: TextStyle(
                                      fontSize: 16,
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
                  child: Column(
                    children: [
                      //ITEM
                      TextButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: Icon(
                            Icons.person_outline,
                            color: Warna.Primary,
                          ),
                          title: Text(
                            'Pengaturan Akun',
                            style: TextStyle(
                                fontFamily: 'URW',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      //ITEM

                      //ITEM
                      TextButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: Icon(
                            Icons.assistant_outlined,
                            color: Warna.Primary,
                          ),
                          title: Text(
                            'Level Anda',
                            style: TextStyle(
                                fontFamily: 'URW',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      //ITEM

                      //ITEM
                      TextButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: Icon(
                            Icons.settings_outlined,
                            color: Warna.Primary,
                          ),
                          title: Text(
                            'Pengaturan',
                            style: TextStyle(
                                fontFamily: 'URW',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      //ITEM
                      Divider(),
                      //ITEM
                      TextButton(
                        onPressed: () {},
                        child: ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Warna.Primary,
                          ),
                          title: Text(
                            'Logout',
                            style: TextStyle(
                                fontFamily: 'URW',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      //ITEM
                    ],
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
//HALAMAN PROFIL

/* SIDEBAR */
class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Warna.Primary),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Warna.PrimaryDark,
              ),
              child: Container(
                margin: EdgeInsets.all(5),
                child: FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              'assets/images/me.jpeg'), // Replace with your image asset path
                        ),
                      ),
                      Text(
                        'MUHAMMAD KHOLIS',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'URW',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'BRONZE, 0 Poin',
                        style: TextStyle(
                            color: Warna.Secondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Warna.Secondary,
                      ),
                      title: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          alignment: Alignment.centerLeft,
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Warna
                                    .PrimaryHalf; // Change this to your desired color
                              }
                              return Warna
                                  .PrimaryHalf; // Use the default overlay color
                            },
                          ),
                        ),
                        child: Text('Home'),
                      ),
                      onTap: () {
                        // Handle navigation to the home screen
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Add more ListTiles for other menu items as needed

            Divider(),
            // Footer item
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(
                    'v Beta 0.0.1',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Handle footer item tap
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} /* SIDEBAR */
