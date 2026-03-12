import 'dart:io';

class Mahasiswa {
  String? nama;
  String? nim;
  String? jurusan;
  double? ipk;

  void tampilNama() {
    nama = "Muhammad Rizky";
    print("Nama : $nama");
  }

  void tampilkanData() {
    print("Nama : ${nama ?? "Nama masih kosong"}");
    print("NIM : ${nim ?? "NIM masih kosong"}");
    print("Jurusan : ${jurusan ?? "Jurusan masih kosong"}");
    print("IPK : ${ipk ?? "IPK masih kosong"}");
  }
}

// === Class ===
// void main() {
//   var mhs1 = Mahasiswa();
//   mhs1.tampilNama();

//   stdout.write("Masukkan nama : ");
//   String? nama = stdin.readLineSync();
//   if (nama != null && nama.isNotEmpty) {
//     mhs1.nama = nama;
//     print("Nama berhasil diubah menjadi $nama");
//   } else {
//     print("Nama tidak boleh kosong");
//   }
// }

// === Object ===
// void main() {
//   Mahasiswa mhs1 = Mahasiswa();
//   mhs1.tampilkanData();

//   stdout.write("\nMasukkan nama : ");
//   String? nama = stdin.readLineSync();
//   if (nama != null && nama.isNotEmpty) {
//     mhs1.nama = nama;
//   } else {
//     print("Nama tidak boleh kosong");
//   }

//   stdout.write("Masukkan NIM : ");
//   String? nim = stdin.readLineSync();
//   if (nim != null && nim.isNotEmpty) {
//     mhs1.nim = nim;
//   } else {
//     print("NIM tidak boleh kosong");
//   }

//   stdout.write("Masukkan Jurusan : ");
//   String? jurusan = stdin.readLineSync();
//   if (jurusan != null && jurusan.isNotEmpty) {
//     mhs1.jurusan = jurusan;
//   } else {
//     print("Jurusan tidak boleh kosong");
//   }

//   stdout.write("Masukkan IPK : ");
//   String? ipk = stdin.readLineSync();
//   if (ipk != null && ipk.isNotEmpty) {
//     mhs1.ipk = double.parse(ipk);
//   } else {
//     print("IPK tidak boleh kosong");
//   }

//   mhs1.tampilkanData();
// }

// === Extends ===
class MahasiswaAktif extends Mahasiswa {
  int? semester;
  double? ipk;
  String? dosenWali;
}

class MahasiswaNonAktif extends Mahasiswa {
  int? tahunLulus;
  String? nomerIjazah;
  String? pekerjaan;
}

// === Mixin ===
mixin Peneliti {
  void melakukanPenelitian() {
    print("Sedang melakukan penelitian");
  }
}

mixin Pengajar {
  void mengajar() {
    print("Sedang mengajar");
  }
}

mixin Jurnal {
  void mempublikasikanJurnal() {
    print("Sedang mempublikasikan jurnal");
  }
}

mixin Organisasi {
  void ikutOrganisasi() {
    print("Sedang mengikuti organisasi");
  }
}

class Dosen extends Mahasiswa with Peneliti, Pengajar, Jurnal {
  String? nidn;
  String? jabatanAkademik;

  void aktivitasDosen() {
    melakukanPenelitian();
    mengajar();
    mempublikasikanJurnal();
  }
}

class Fakultas extends Mahasiswa with Peneliti, Organisasi, Jurnal {
  String? kodeFakultas;
  String? namaFakultas;

  void aktivitasFakultas() {
    melakukanPenelitian();
    ikutOrganisasi();
    mempublikasikanJurnal();
  }
}

