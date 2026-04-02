import 'package:test_app/core/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:test_app/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  final DioClient _dioClient;

  MahasiswaRepository({DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  /// get data daftar mahasiswa
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final Response response = await _dioClient.dio.get('/comments');
      final List<dynamic> data = response.data;
      return data.map((json) => MahasiswaModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception(
        'Gagal memuat data mahasiswa: ${e.response?.statusCode} - ${e.message}',
      );
    }
  }

  /// get data profile mahasiswa
  Future<MahasiswaModel> getProfile() async {
    try {
      final Response response = await _dioClient.dio.get('/comments/1');
      final Map<String, dynamic> data = response.data;
      return MahasiswaModel.fromJson(data);
    } on DioException catch (e) {
      throw Exception(
        'Gagal memuat data profile: ${e.response?.statusCode} - ${e.message}',
      );
    }
  }
}
