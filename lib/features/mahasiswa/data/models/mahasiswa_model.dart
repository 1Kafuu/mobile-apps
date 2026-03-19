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

  /// Mapped from JSONPlaceholder comments API
  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    final postId = json['postId'];
    final id = json['id'];
    final body = json['body'] ?? '';

    return MahasiswaModel(
      nama: json['name']?.toString() ?? '',
      nim: id?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      jurusan: body.toString().split('\n').first,
      isAktif:
          (postId is int
                  ? postId
                  : int.tryParse(postId?.toString() ?? '0') ?? 0) %
              2 ==
          0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': nama,
      'id': nim,
      'email': email,
      'body': jurusan,
      'postId_even': isAktif,
    };
  }
}
