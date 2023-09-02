import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  int toplam = 0;

  void _hesapla() {
    int girilenSayi = int.tryParse(_controller.text) ?? 0;
    if (girilenSayi % 2 == 0) {
      setState(() {
        toplam += girilenSayi;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Çift Sayıların Toplamı'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Sayı Girin',
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _hesapla();
                  _controller.clear();
                },
                child: Text('Hesapla'),
              ),
              SizedBox(height: 20),
              Text(
                'Çift sayıların toplamı:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$toplam',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
