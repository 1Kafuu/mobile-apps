import 'dart:ffi';
import 'dart:io';

void main() {

  // Contoh 1

  //  List<String> names = ['Alfa', 'Beta', 'Charlie'];
  //  print('Names : $names');

  //  names.add('Delta');
  //  print('Names setelah ditambahkan: $names');

  //  print('Element pertama: ${names[0]}');
  //  print('Element kedua: ${names[1]}');

  //  names.remove('Charlie');
  //  print('Names setelah dihapus: $names');

  //  print('Jumlah data: ${names.length}');

  //  print('Menampilkan setiap element:');
  //  for (String name in names){
  //   print(name);
  //  }

  // Contoh 2

  // List<String> dataList = [];
  // print('Data list kosong: $dataList');

  // int count = 0;
  // while (count <= 0) {
  //   stdout.write('Masukkan jumlah list : ');
  //   String? input = stdin.readLineSync();
  //   try {
  //     count = int.parse(input!);
  //     if (count <= 0 ) {
  //       print('Masukkan angka lebih dari 0');
  //     }
  //   } catch (e) {
  //     print('Input tidak valid! Masukkan angka yang benar.');
  //   }
  // }

  // for (int i = 0; i < count; i++) {
  //   stdout.write("Date ke-${i+1}: ");
  //   String x = stdin.readLineSync()!;
  //   dataList.add(x);
  // }

  // print("Data list: ");
  // print(dataList);

  // Latihan Soal 

    List<String> dataList = [];
    print('Data list kosong: $dataList');

    // Bikin array-nya
    int count = 0;
    while (count <= 0) {
      stdout.write('Masukkan jumlah list : ');
      String? input = stdin.readLineSync();
      try {
        count = int.parse(input!);
        if (count <= 0 ) {
          print('Masukkan angka lebih dari 0');
        }
      } catch (e) {
        print('Input tidak valid! Masukkan angka yang benar.');
      }
    }

    // Input data
    for (int i = 0; i < count; i++) {
      stdout.write("Date ke-${i+1}: ");
      String x = stdin.readLineSync()!;
      dataList.add(x);
    }

    print('Data List: ');
    print(dataList);

  int index = 0;
  while (index <= 0) {
    try {
      stdout.write('Masukkan index data yang mau diubah : ');
      String x = stdin.readLineSync()!;
      index = int.parse(x);
      if (index <= 0) {
        print('Masukkan nilai yang lebih dari nol');
      }
    } catch (e) {
      print('Input tidak valid masukkan angka yang benar');
      index = 1;
    }
  }
  
  index = index-1;

  stdout.write('Masukkan nilai penggantinya: ');
  String change = stdin.readLineSync()!;
  
  dataList[index] = change;
  print("Data ke-${index} diubah menjadi $change");
  print("Data List terbaru : $dataList");

  int remove = 0;
  while (remove <= 0) {
    try {
      stdout.write('Masukkan index data yang mau dihapus : ');
      String y = stdin.readLineSync()!;
      remove = int.parse(y);
      if (remove <= 0) {
        print('Masukkan nilai yang lebih dari nol');
      }
    } catch (e) {
      print('Input tidak valid masukkan angka yang benar');
    }
  }
  
  remove = remove-1;
  print("Data yang dihapus adalah ${dataList[remove]} data ke-${remove}");
  dataList.remove(dataList[remove]);
  print("Data List terbaru : $dataList");

}
