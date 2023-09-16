import 'package:flutter/material.dart';
import 'package:Policy_Centre_Point/warna.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shimmer/shimmer.dart';

class Detail_Acara extends StatefulWidget {
  final String id;
  final String nama_acara;
  final String status;
  Detail_Acara(
      {required this.id, required this.nama_acara, required this.status});

  @override
  _Detail_AcaraState createState() => _Detail_AcaraState();
}

class _Detail_AcaraState extends State<Detail_Acara> {
  /* DATA TAB3 */
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
  /* DATA TAB3 */

  /* DATA TAB2 */
  List<String> tabTitles = ['Hari 1', 'Hari 2', 'Hari 3', 'Hari 4', 'Hari 5'];
  /* DATA TAB2 */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            centerTitle: false,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            title: Text(
              'DETAIL ACARA',
              style: TextStyle(
                  color: Colors.white,
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
                  color: Colors.white,
                ),
              ),
            ],
            iconTheme: IconThemeData(
              color: Warna.TextBold, // Change the drawer icon color here
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Deskripsi'),
                Tab(text: 'Kehadiran'),
                Tab(text: 'Panitia'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              /* TAB1 */
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      /* Banner */
                      Container(
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/me.jpeg', // Replace with the image path of your event
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      /* Banner */

                      /* Event Details */
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget
                                  .nama_acara, // Replace with your event's name
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.calendar_today, color: Colors.grey),
                                SizedBox(width: 5),
                                Text(
                                  'Event Date', // Replace with your event's date
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.grey),
                                SizedBox(width: 5),
                                Text(
                                  'Event Location', // Replace with your event's location
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Event Description:', // Replace with your event's description
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in justo eget nisi...',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      /* Event Details */
                    ],
                  ),
                ),
              ),
              /* TAB1 */

              /* TAB2 */
              DefaultTabController(
                length: tabTitles
                    .length, // Jumlah tab sesuai dengan jumlah judul yang diberikan oleh pengguna
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Color(0xFF1a1b19),
                    leading: Text(''),
                    bottom: TabBar(
                      tabs: tabTitles.map((title) => Tab(text: title)).toList(),
                    ),
                  ),
                  body: TabBarView(
                    children: tabTitles
                        .map((title) => Center(child: Text(title)))
                        .toList(),
                  ),
                ),
              ),
              /* TAB2 */

              /* TAB3 */
              FutureBuilder<List<MenuItem>>(
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
                                    backgroundColor: MaterialStatePropertyAll(
                                        Warna.Primary)),
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
              /* TAB3 */
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
          print('FAB pressed');
        },
        tooltip: 'Absen Acara',
        child: const Icon(Icons.qr_code_scanner_outlined),
        backgroundColor: Warna.Primary,
      ),
    );
  }
}

/* ISI TAB3 */
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
/* ISI TAB3 */