import '../models/mahasiswa_aktif.dart';

class MahasiswaAktifRepository {
  /// Mendapatkan daftar mahasiswa yang berstatus aktif saja
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy mahasiswa aktif
    return [
      MahasiswaAktifModel(
        nama: 'Ahmad Fauzi',
        nim: '220411100010',
        email: 'ahmad.fauzi@student.ac.id',
        prodi: 'D4 Teknik Informatika',
      ),
      MahasiswaAktifModel(
        nama: 'Larasati Putri',
        nim: '220411100015',
        email: 'larasati.p@student.ac.id',
        prodi: 'D4 Teknik Informatika',
      ),
    ];
  }
}