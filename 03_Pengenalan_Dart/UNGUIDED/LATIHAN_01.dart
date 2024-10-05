import 'dart:io';

// Fungsi utama untuk menjalankan program
void main() {
  // Tugas 1: Menerima input nilai
  print('Masukkan nilai: ');
  String? inputNilai = stdin.readLineSync(); // Membaca input dari pengguna

  if (inputNilai != null && int.tryParse(inputNilai) != null) {
    int nilai = int.parse(inputNilai); // Mengonversi input ke integer
    String hasil;

    // Memeriksa nilai
    if (nilai > 70) {
      hasil = "Nilai A";
    } else if (nilai > 40 && nilai <= 70) {
      hasil = "Nilai B";
    } else if (nilai > 0 && nilai <= 40) {
      hasil = "Nilai C";
    } else {
      hasil = "Nilai tidak valid.";
    }
    print('$nilai merupakan $hasil'); // Menampilkan hasil
  } else {
    print('Input tidak valid, harap masukkan bilangan bulat.');
  }

  // Tugas 2: Menampilkan piramida bintang
  print('Masukkan tinggi piramida: ');
  String? inputTinggi = stdin.readLineSync();

  if (inputTinggi != null && int.tryParse(inputTinggi) != null) {
    int tinggi = int.parse(inputTinggi);

    // Mencetak piramida
    for (int i = 1; i <= tinggi; i++) {
      String line = ''; // Variabel untuk menyimpan baris

      // Menambahkan spasi di depan
      for (int j = tinggi; j > i; j--) {
        line += ' '; // Menambahkan spasi ke string
      }

      // Menambahkan bintang ke baris
      for (int k = 1; k <= (2 * i - 1); k++) {
        line += '*'; // Menambahkan bintang ke string
      }

      print(line); // Mencetak seluruh baris
    }
  } else {
    print('Input tidak valid, harap masukkan bilangan bulat.');
  }

  // Tugas 3: Mengecek bilangan prima
  print('Masukkan bilangan bulat: ');
  String? inputBilangan = stdin.readLineSync();

  if (inputBilangan != null && int.tryParse(inputBilangan) != null) {
    int bilangan = int.parse(inputBilangan);

    if (isPrima(bilangan)) {
      print('$bilangan merupakan bilangan prima');
    } else {
      print('$bilangan bukan bilangan prima');
    }
  } else {
    print('Input tidak valid, harap masukkan bilangan bulat.');
  }
}

// Fungsi untuk mengecek apakah bilangan prima
bool isPrima(int number) {
  if (number <= 1) {
    return false; // 0 dan 1 bukan bilangan prima
  }
  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) {
      return false; // Bilangan habis dibagi
    }
  }
  return true; // Bilangan prima
}
