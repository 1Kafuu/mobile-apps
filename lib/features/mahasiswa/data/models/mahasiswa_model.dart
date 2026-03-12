class MahasiswaModel {
  final String nama;
  final String nim;
  final String email;
  final String jurusan;
  final bool isAktif;

  MahasiswaModel({
    required this.nama,
    required this.nim,
    required this.email,
    required this.jurusan,
    required this.isAktif,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      nama: json['nama'] ?? '',
      nim: json['nim'] ?? '',
      email: json['email'] ?? '',
      jurusan: json['jurusan'] ?? '',
      isAktif: json['is_aktif'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'nim': nim,
      'email': email,
      'jurusan': jurusan,
      'is_aktif': isAktif,
    };
  }
}