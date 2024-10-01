import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BioScreen(),
    );
  }
}

class BioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BIODATA',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF8B0000),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('../assets/tik.jpg'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Dewi Atika Muthi',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B0000),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Colors.grey[200],
                elevation: 2,
                child: ListTile(
                  leading: Icon(Icons.email, color: Color(0xFF8B0000)),
                  title: Text('mutgetstressed@gmail.com'),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Colors.grey[200],
                elevation: 2,
                child: ListTile(
                  leading: Icon(Icons.phone, color: Color(0xFF8B0000)),
                  title: Text('+62 222 888 999'),
                ),
              ),
              SizedBox(height: 20),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Colors.grey[300],
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Things:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8B0000),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('• Labubuu'),
                      Text('• Dinoo'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Social Media:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B0000),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Instagram: instagram.com/tikature',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'GitHub: github.com/tikature',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
