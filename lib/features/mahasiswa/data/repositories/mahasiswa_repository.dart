import '../models/mahasiswa_model.dart';

class MahasiswaRepository {
  /// Mendapatkan daftar mahasiswa aktif
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy mahasiswa
    return [
      MahasiswaModel(
        nama: 'Budi Santoso',
        nim: '220411100001',
        email: 'budi.santoso@example.com',
        jurusan: 'Teknik Informatika',
        isAktif: true,
      ),
      MahasiswaModel(
        nama: 'Siti Aminah',
        nim: '220411100002',
        email: 'siti.aminah@example.com',
        jurusan: 'Sistem Informasi',
        isAktif: true,
      ),
      MahasiswaModel(
        nama: 'Rizky Pratama',
        nim: '220411100003',
        email: 'rizky.p@example.com',
        jurusan: 'Teknik Elektro',
        isAktif: false,
      ),
    ];
  }

  /// Mendapatkan data profil mahasiswa
  Future<MahasiswaModel> getProfile() async {
    await Future.delayed(const Duration(seconds: 1));
    return MahasiswaModel(
      nama: 'Profil User Mahasiswa',
      nim: '220411100999',
      email: 'my.profile@example.com',
      jurusan: 'Teknik Informatika',
      isAktif: true,
    );
  }
}