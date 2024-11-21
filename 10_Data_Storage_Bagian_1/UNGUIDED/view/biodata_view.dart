import 'package:flutter/material.dart';
import '../helper/database_helper.dart';

class BiodataMahasiswaView extends StatefulWidget {
  const BiodataMahasiswaView({super.key});

  @override
  State<BiodataMahasiswaView> createState() => _BiodataMahasiswaViewState();
}

class _BiodataMahasiswaViewState extends State<BiodataMahasiswaView> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _mahasiswaList = [];

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  void _refreshData() async {
    final data = await dbHelper.queryAllRows();
    setState(() {
      _mahasiswaList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('SQLite Biodata Mahasiswa'),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
      ),
      body: Column(
        children: [
          Expanded(
            child: _mahasiswaList.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_search,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Belum ada data mahasiswa',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _mahasiswaList.length,
                    itemBuilder: (context, index) {
                      final mahasiswa = _mahasiswaList[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mahasiswa['nama'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text('NIM: ${mahasiswa['nim']}'),
                                  Text('Alamat: ${mahasiswa['alamat']}'),
                                  Text('Hobi: ${mahasiswa['hobi']}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _BuildInputForm(
                refreshData: _refreshData,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _BuildInputForm extends StatelessWidget {
  final Function refreshData;
  final Map<String, dynamic>? existingData;
  final DatabaseHelper dbHelper = DatabaseHelper();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _hobiController = TextEditingController();

  _BuildInputForm({required this.refreshData, this.existingData}) {
    if (existingData != null) {
      _namaController.text = existingData!['nama'] ?? '';
      _nimController.text = existingData!['nim'] ?? '';
      _alamatController.text = existingData!['alamat'] ?? '';
      _hobiController.text = existingData!['hobi'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Biodata Mahasiswa',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                prefixIcon: Icon(Icons.person, color: Colors.pink),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nimController,
              decoration: const InputDecoration(
                labelText: 'NIM',
                prefixIcon: Icon(Icons.badge, color: Colors.pink),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
                prefixIcon: Icon(Icons.home, color: Colors.pink),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _hobiController,
              decoration: const InputDecoration(
                labelText: 'Hobi',
                prefixIcon: Icon(Icons.favorite, color: Colors.pink),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                minimumSize: const Size.fromHeight(50),
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                if (_namaController.text.isEmpty ||
                    _nimController.text.isEmpty ||
                    _alamatController.text.isEmpty ||
                    _hobiController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Semua field harus diisi!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                await dbHelper.insert({
                  'nama': _namaController.text,
                  'nim': _nimController.text,
                  'alamat': _alamatController.text,
                  'hobi': _hobiController.text,
                });
                refreshData();
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Data berhasil disimpan!'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              icon: const Icon(Icons.save),
              label: const Text(
                'Simpan Data',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
