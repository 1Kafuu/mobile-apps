import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/mahasiswa_model.dart';

class MahasiswaRepository {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';

  /// Mendapatkan daftar mahasiswa dari JSONPlaceholder comments
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    final response = await http.get(Uri.parse('$_baseUrl/comments'));

    if (response.statusCode != 200) {
      throw Exception(
        'Gagal memuat daftar komentar dari API (${response.statusCode})',
      );
    }

    final data = jsonDecode(response.body);
    if (data is! List) {
      throw Exception('Format data tidak sesuai (diharapkan list)');
    }

    return data
        .cast<Map<String, dynamic>>()
        .map((json) => MahasiswaModel.fromJson(json))
        .toList();
  }

  /// Mendapatkan data profil mahasiswa dari JSONPlaceholder comment pertama
  Future<MahasiswaModel> getProfile() async {
    final response = await http.get(Uri.parse('$_baseUrl/comments/1'));

    if (response.statusCode != 200) {
      throw Exception('Gagal memuat profil dari API (${response.statusCode})');
    }

    final data = jsonDecode(response.body);
    if (data is! Map<String, dynamic>) {
      throw Exception('Format profil tidak sesuai (diharapkan object)');
    }

    return MahasiswaModel.fromJson(data);
  }
}
