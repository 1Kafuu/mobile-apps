class MahasiswaAktifModel {
  final String nama;
  final String nim;
  final String prodi; // Menggunakan prodi untuk variasi

  MahasiswaAktifModel({
    required this.nama,
    required this.nim,
    required this.prodi,
  });

  factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
    final userId = json['userId'];
    final id = json['id'];
    final body = json['body']?.toString() ?? '';
    return MahasiswaAktifModel(
      nama: json['title']?.toString() ?? '',
      nim: userId != null && id != null
          ? '${userId.toString()}-${id.toString()}'
          : '',
      prodi: body.split('\n').first,
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': nama, 'id': nim, 'body': prodi};
  }
}
