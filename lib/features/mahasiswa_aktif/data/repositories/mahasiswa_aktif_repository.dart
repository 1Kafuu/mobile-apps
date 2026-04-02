import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/mahasiswa_aktif.dart';

class MahasiswaAktifRepository {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    final response = await http.get(Uri.parse('$_baseUrl/posts'));

    if (response.statusCode != 200) {
      throw Exception('Gagal memuat daftar posts (${response.statusCode})');
    }

    final data = jsonDecode(response.body);
    if (data is! List) {
      throw Exception('Format data tidak sesuai: diharapkan list posts');
    }

    return data
        .cast<Map<String, dynamic>>()
        .map((json) => MahasiswaAktifModel.fromJson(json))
        .toList();
  }
}
