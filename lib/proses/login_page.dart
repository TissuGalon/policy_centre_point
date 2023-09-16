import 'package:Policy_Centre_Point/proses/register_page.dart';
import 'package:Policy_Centre_Point/warna.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';
  bool isLoading = false; // Initialize isLoading as false

  Future<void> _login() async {
    setState(() {
      isLoading = true; // Set isLoading to true when login process starts
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    final response = await http.post(
      Uri.parse('https://example.com/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    setState(() {
      isLoading = false; // Set isLoading to false after login process is done
    });

    Center(
      child: isLoading ? CircularProgressIndicator() : Text('Data Loaded'),
    );

    if (response.statusCode == 200) {
      // Login berhasil, lakukan sesuatu seperti menyimpan data sesi.
      // Misalnya, pindah ke halaman lain.
      isLoading = false;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage(false)));
    } else {
      // Penanganan jika login gagal.
      // Tampilkan pesan kesalahan kepada pengguna.
      isLoading = false;
      setState(() {
        _errorMessage = 'Login gagal. Cek kembali email dan password Anda.';
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Gagal'),
            content: Text(_errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the pop-up
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                          fontSize: 64,
                          fontFamily: 'URW',
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Welcome!',
                      style: TextStyle(
                          fontSize: 64,
                          fontFamily: 'URW',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              children: [
                isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _login,
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontFamily: 'URW', fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Warna
                              .Primary, // Set the button's background color to pink
                          padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15), // Adjust padding for size
                          textStyle:
                              TextStyle(fontSize: 20), // Adjust text size
                        ),
                      ),
                SizedBox(width: 14.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                  child: Text(
                    'DAFTAR',
                    style: TextStyle(
                        fontFamily: 'URW',
                        fontWeight: FontWeight.bold,
                        color: Warna.TextBold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary:
                        Warna.BG, // Set the button's background color to pink
                    padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15), // Adjust padding for size
                    textStyle: TextStyle(
                      fontSize: 18,
                    ), // Adjust text size
                  ),
                ),
              ],
            ),
            SizedBox(height: 64.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainPage(false)));
              },
              child: Text(
                'MASUK TANPA LOGIN',
                style: TextStyle(
                    fontFamily: 'URW',
                    fontWeight: FontWeight.bold,
                    color: Warna.TextNormal),
              ),
              style: ElevatedButton.styleFrom(
                primary: Warna.BG
                    .withOpacity(0.7), // Set a transparent background color
                onPrimary: Colors
                    .white, // Set the text color to contrast with the background color
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      30), // Set the border radius for a rounded button
                  side:
                      BorderSide(color: Colors.white), // Add an optional border
                ),
                elevation: 0, // Add elevation to create a glossy effect
              ),
            ),
          ],
        ),
      ),
    );
  }
}
