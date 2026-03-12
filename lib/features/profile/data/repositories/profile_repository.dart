import '../models/profile.dart';

class ProfileRepository {
  /// Mendapatkan data profil pengguna
  Future<ProfileModel> getProfile() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy profil
    return ProfileModel(
      nama: 'Budi Santoso',
      nim: '220411100001',
      email: 'budi.santoso@student.mail.com',
      jurusan: 'D4 Teknik Informatika',
      fotoUrl: 'https://ui-avatars.com/api/?name=Budi+Santoso&size=128',
    );
  }
}