import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/mahasiswa_aktif.dart';
import '../../data/repositories/mahasiswa_aktif_repository.dart';

// Repository Provider
final mahasiswaAktifRepositoryProvider = Provider<MahasiswaAktifRepository>((ref) {
  return MahasiswaAktifRepository();
});

// StateNotifier untuk mengelola state mahasiswa aktif
class MahasiswaAktifNotifier extends StateNotifier<AsyncValue<List<MahasiswaAktifModel>>> {
  final MahasiswaAktifRepository _repository;

  MahasiswaAktifNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadMahasiswaAktif();
  }

  Future<void> loadMahasiswaAktif() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getMahasiswaAktifList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadMahasiswaAktif();
  }
}

// Mahasiswa Aktif Notifier Provider
final mahasiswaAktifNotifierProvider = 
    StateNotifierProvider.autoDispose<MahasiswaAktifNotifier, AsyncValue<List<MahasiswaAktifModel>>>((ref) {
  final repository = ref.watch(mahasiswaAktifRepositoryProvider);
  return MahasiswaAktifNotifier(repository);
});