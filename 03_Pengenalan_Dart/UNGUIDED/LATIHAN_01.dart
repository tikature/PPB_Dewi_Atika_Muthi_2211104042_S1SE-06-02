void main() {
  print('Praktikum Perangkat Bergerak \n');

  // PENAMAAN VARIABLE MENGGUNAKAN CAMELCASE
  print('=====Variable====');
  var name = 'Tika';
  String loc = 'Bandung';
  var age = 21;
  final cuaca = 'Cerah';

  print('Hello Customer, $name.\nYou are $age');
  print('Hari ini, $cuaca di $loc');

  print('\n');

// STATEMENT CONTROL PERULANGAN : if else
  print('====Statement Control: IF-ELSE====');
  var open = 8;
  var close = 23;
  var now = 12;

  print('Sekarang jam $now, status cafe:');

  if (now == 12) {
    print('Cafe kami sedang break');
  } else if (now >= open && now < close) {
    print('Cafe ini buka');
  } else {
    print('Cafe sudah tutup');
  }

// STATEMENT CONTROL PERULANGAN : if else-true : false
  print('====IF ELSE DENGAN TRUE FALSE====');
  var nowT = 10;
  var openT = 7;
  var toko = nowT > openT ? "Toko Buka" : "Toko Tutup";
  print('Sekarang jam $nowT, status toko:');
  print(toko);

  print('\n');

// SWITCH CASE : NILAI
  print('====SWITCH CASE====');
  var nilai = 85;

  // KONDISI if else untuk grade
  String grade;
  if (nilai >= 90) {
    grade = 'a';
  } else if (nilai >= 80) {
    grade = 'b';
  } else if (nilai >= 70) {
    grade = 'c';
  } else if (nilai >= 60) {
    grade = 'd';
  } else {
    grade = 'f';
  }
  print('Nilai kamu: $nilai \nGrade kamu: $grade');

  // SWITCH CASE untuk grade
  switch (grade) {
    case 'a':
      print("Nilai kamu sangat bagus");
      break;
    case 'b':
      print("Nilai kamu baik");
      break;
    case 'c':
      print("Nilai sudah cukup");
      break;
    case 'd':
      print("Nilai kamu lumayan");
      break;
    case 'f':
      print("Nilai kamu gagal");
      break;
  }
  print('\n');

  // For loop untuk mencetak angka 1 sampai 5
  print('====FOR LOOP====');
  for (int i = 1; i <= 5; i++) {
    print(i);
  }
  // While loop
  print('====WHILE LOOP====');
  int i = 1;
  while (i <= 5) {
    print('Angka: $i');
    i++;
  }

  print('\n');

// LIST
  print('====LIST====');
  List<int> fixedList = List.filled(3, 0);

  fixedList[0] = 10;
  fixedList[1] = 20;
  fixedList[2] = 30;

  print('fixed list : $fixedList');

  print('Membuat list baru:');
  List<int> growableList = [];

  growableList.add(10);
  growableList.add(20);
  growableList.add(30);

  print(growableList);

  print('Menambahkan elemen baru dengan ADD:');
  growableList.add(40);
  growableList.add(50);
  growableList.add(60);

  print(growableList);

  print('Menghapus elemen yang ada dengan REMOVE:');
  growableList.remove(20);

  print(growableList);

  print('\n');

// FUNGSI
  print('====FUNGSI====');
  void cetakPesan(String pesan) {
    print(pesan); // mendefinisikan fungsi tanpa mengembalikan nilai
  }

  int perkalian(int a, int b) {
    return a * b; // mengemmbalikan nilai dengan return
  }

  int hasil = perkalian(4, 3); // Memanggil fungsi: perkalian
  print('Hasil perkalian fungsi = $hasil'); // Memanggil fungsi
  cetakPesan(
      'Selesai, sampai bertemu lagi di pertemuan selanjutnya!'); // Memanggil fungsi
}
