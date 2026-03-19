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
    if (mahasiswaList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people_outline, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            const Text(
              'Tidak ada data mahasiswa',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tarik ke bawah untuk refresh',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mahasiswaList.length,
        itemBuilder: (context, index) {
          final mahasiswa = mahasiswaList[index];
          return MahasiswaCard(mahasiswa: mahasiswa, isModern: useModernCard);
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
    final gradientColors = [
      Theme.of(context).primaryColor.withOpacity(0.16),
      Theme.of(context).primaryColor.withOpacity(0.04),
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(isModern ? 18 : 12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.18),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(isModern ? 18 : 12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      mahasiswa.nama.isNotEmpty
                          ? mahasiswa.nama[0].toUpperCase()
                          : '-',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mahasiswa.nama,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'NIM: ${mahasiswa.nim}',
                        style: const TextStyle(color: Colors.black87),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Email: ${mahasiswa.email}',
                        style: const TextStyle(color: Colors.black87),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        mahasiswa.jurusan,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: mahasiswa.isAktif
                        ? Colors.green.shade50
                        : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: mahasiswa.isAktif ? Colors.green : Colors.red,
                    ),
                  ),
                  child: Text(
                    mahasiswa.isAktif ? 'Aktif' : 'Non-Aktif',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: mahasiswa.isAktif
                          ? Colors.green.shade700
                          : Colors.red.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
