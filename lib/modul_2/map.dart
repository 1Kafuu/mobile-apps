import 'dart:io';

void main() {
  Map<String, dynamic> dataMahasiswa = {};
  print('Data mahasiswa : $dataMahasiswa');

  print('\n=== INPUT SINGLE DATA MAHASISWA ===');

  stdout.write('Masukkan NIM : ');
  String nim = stdin.readLineSync() ?? '';

  stdout.write('Masukkan Nama : ');
  String nama = stdin.readLineSync() ?? '';

  stdout.write('Masukkan Jurusan : ');
  String jurusan = stdin.readLineSync() ?? '';

  stdout.write('Masukkan IPK : ');
  double ipk = double.tryParse(stdin.readLineSync() ?? '0') ?? 0.0;

  Map<String, dynamic> mahasiswa = {
    'nim': nim,
    'nama': nama,
    'jurusan': jurusan,
    'ipk': ipk,
  };

  dataMahasiswa[nim] = mahasiswa;

  print('Data mahasiswa : $dataMahasiswa');

  print('\n=== INPUT MULTIPLE DATA MAHASISWA ===');

  int count = 0;
  while (count <= 0) {
    stdout.write('Masukkan jumlah data yang ingin dimasukkan : ');
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

  for (int i = 0; i < count; i++) {
    print('\n --- Mahasiswa ke-${i + 1} ---');

    stdout.write('Masukkan NIM : ');
    String nim = stdin.readLineSync() ?? '';

    stdout.write('Masukkan Nama : ');
    String nama = stdin.readLineSync() ?? '';

    stdout.write('Masukkan Jurusan : ');
    String jurusan = stdin.readLineSync() ?? '';

    stdout.write('Masukkan IPK : ');
    double ipk = double.tryParse(stdin.readLineSync() ?? '0') ?? 0.0;

    Map<String, dynamic> mahasiswa = {
      'nim': nim,
      'nama': nama,
      'jurusan': jurusan,
      'ipk': ipk,
    };

    dataMahasiswa[nim] = mahasiswa;
  }

  print('\n$count data mahasiswa berhasil ditambahkan!');

  print('Data mahasiswa : $dataMahasiswa');

  print('\n=== UBAH DATA MAHASISWA ===');

  if (dataMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa!');
    return;
  }

  print('--- DAFTAR NIM MAHASISWA ---');

  if (dataMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa!');
    return;
  }

  List<String> daftarNIM = dataMahasiswa.keys.toList();
  for (int i = 0; i < daftarNIM.length; i++) {
    print('${i + 1}. ${daftarNIM[i]}');
  }

  stdout.write('\nMasukkan NIM mahasiswa yang akan diubah: ');
  String nimUpdate = stdin.readLineSync() ?? '';

  if (dataMahasiswa.containsKey(nim)) {
    print('\nData saat ini:');
    print('Nama: ${dataMahasiswa[nimUpdate]!['nama']}');
    print('Jurusan: ${dataMahasiswa[nimUpdate]!['jurusan']}');
    print('IPK: ${dataMahasiswa[nimUpdate]!['ipk']}');

    print('\nMasukkan data baru (kosongkan jika tidak ingin mengubah):');

    stdout.write('Nama baru: ');
    String namaBaru = stdin.readLineSync() ?? '';
    if (namaBaru.isNotEmpty) {
      dataMahasiswa[nimUpdate]!['nama'] = namaBaru;
    }

    stdout.write('Jurusan baru: ');
    String jurusanBaru = stdin.readLineSync() ?? '';
    if (jurusanBaru.isNotEmpty) {
      dataMahasiswa[nimUpdate]!['jurusan'] = jurusanBaru;
    }

    stdout.write('IPK baru: ');
    String ipkInput = stdin.readLineSync() ?? '';
    if (ipkInput.isNotEmpty) {
      double ipkBaru = double.tryParse(ipkInput) ?? dataMahasiswa[nim]!['ipk'];
      dataMahasiswa[nimUpdate]!['ipk'] = ipkBaru;
    }

    print('\nData berhasil diubah!');
  } else {
    print('NIM $nimUpdate tidak ditemukan!');
  }

  print('\n=== CARI DATA MAHASISWA ===');

  if (dataMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa!');
    return;
  }

  stdout.write('Masukkan NIM yang dicari: ');
  String nimSearch = stdin.readLineSync() ?? '';

  if (dataMahasiswa.containsKey(nim)) {
    print('\nData ditemukan!');
    print('NIM   : ${dataMahasiswa[nimSearch]!['nim']}');
    print('Nama  : ${dataMahasiswa[nimSearch]!['nama']}');
    print('Jurusan: ${dataMahasiswa[nimSearch]!['jurusan']}');
    print('IPK   : ${dataMahasiswa[nim]!['ipk']}');
  } else {
    print('NIM $nimSearch tidak ditemukan!');
  }

  print('\n=== HAPUS DATA MAHASISWA ===');

  if (dataMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa!');
    return;
  }

  print('--- DAFTAR NIM MAHASISWA ---');

  if (dataMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa!');
    return;
  }

  List<String> daftarNIMRemove = dataMahasiswa.keys.toList();
  for (int i = 0; i < daftarNIM.length; i++) {
    print('${i + 1}. ${daftarNIMRemove[i]}');
  }

  stdout.write('\nMasukkan NIM mahasiswa yang akan dihapus: ');
  String nimRemove = stdin.readLineSync() ?? '';

  if (dataMahasiswa.containsKey(nimRemove)) {
    print('Data yang akan dihapus:');
    print('Nama: ${dataMahasiswa[nimRemove]!['nama']}');
    print('Jurusan: ${dataMahasiswa[nimRemove]!['jurusan']}');

    stdout.write('Yakin ingin menghapus? (y/n): ');
    String konfirmasi = stdin.readLineSync() ?? '';

    if (konfirmasi.toLowerCase() == 'y') {
      dataMahasiswa.remove(nimRemove);
      print('Data berhasil dihapus!');
    } else {
      print('Penghapusan dibatalkan.');
    }
  } else {
    print('NIM $nimRemove tidak ditemukan!');
  }

  stdout.write('\nIngin menampilkan semua data? (y/n): ');
  String konfirmasi = stdin.readLineSync() ?? '';

  if (konfirmasi.toLowerCase() == 'y') {
    print('\n=== SEMUA DATA MAHASISWA ===');
    if (dataMahasiswa.isEmpty) {
      print('Belum ada data mahasiswa!');
      return;
    }
    print('-' * 60);
    print('No | NIM      | Nama                | Jurusan              | IPK');
    print('-' * 60);

    int no = 1;
    dataMahasiswa.forEach((nim, data) {
      print(
        '${no.toString().padRight(2)} | ${nim.padRight(8)} | ${data['nama'].toString().padRight(19)} | ${data['jurusan'].toString().padRight(20)} | ${data['ipk']}',
      );
      no++;
    });
    print('-' * 60);
    print('Total: ${no-1} data');
  } else {
    return;
  }
}
