import 'package:flutter/material.dart';
import '../../data/models/mahasiswa_model.dart';

class MahasiswaListView extends StatelessWidget {
  final List<MahasiswaModel> mahasiswaList;
  final VoidCallback onRefresh;
  final bool useModernCard;

  const MahasiswaListView({
    super.key,
    required this.mahasiswaList,
    required this.onRefresh,
    this.useModernCard = true,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: mahasiswaList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final mahasiswa = mahasiswaList[index];
          return MahasiswaCard(
            mahasiswa: mahasiswa,
            isModern: useModernCard,
          );
        },
      ),
    );
  }
}

class MahasiswaCard extends StatelessWidget {
  final MahasiswaModel mahasiswa;
  final bool isModern;

  const MahasiswaCard({
    super.key,
    required this.mahasiswa,
    this.isModern = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isModern ? 16 : 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Text(
            mahasiswa.nama[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          mahasiswa.nama,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIM: ${mahasiswa.nim}'),
            Text(mahasiswa.jurusan),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: mahasiswa.isAktif ? Colors.green.shade50 : Colors.red.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: mahasiswa.isAktif ? Colors.green : Colors.red,
            ),
          ),
          child: Text(
            mahasiswa.isAktif ? 'Aktif' : 'Non-Aktif',
            style: TextStyle(
              fontSize: 12,
              color: mahasiswa.isAktif ? Colors.green.shade700 : Colors.red.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}