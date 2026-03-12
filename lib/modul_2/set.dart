import 'dart:io';

void main() {
  Set<String> dataList = {};
  print('Data list kosong: $dataList');

  // Bikin array-nya
  int count = 0;
  while (count <= 0) {
    stdout.write('Masukkan jumlah list : ');
    String? input = stdin.readLineSync();
    try {
      count = int.parse(input!);
      if (count <= 0) {
        print('Masukkan angka lebih dari 0');
      }
    } catch (e) {
      print('Input tidak valid! Masukkan angka yang benar.');
    }
  }

  // Input data
  for (int i = 0; i < count; i++) {
    stdout.write("Date ke-${i + 1}: ");
    String x = stdin.readLineSync()!;
    dataList.add(x);
  }

  print('Data List: ');
  print(dataList);

  stdout.write('Masukkan data yang mau ditambahkan : ');
  String z = stdin.readLineSync()!;

  dataList.add(z);
  print('Data List terbaru : $dataList');

  stdout.write('Masukkan data duplikat yang mau ditambahkan : ');
  String duplicate = stdin.readLineSync()!;

  dataList.add(duplicate);
  print('Data List duplikat : $dataList');

  stdout.write('Masukkan data yang mau dihapus : ');
  String remove = stdin.readLineSync()!;

  dataList.remove(remove);
  print("Data yang dihapus adalah $remove, List terbaru : $dataList");

  if (dataList.contains('$remove')) {
    print('$remove ditemukan di list');
  } else {
    print('$remove tidak ditemukan');

    print("Jumlah data : ${dataList.length}");
  }
}
