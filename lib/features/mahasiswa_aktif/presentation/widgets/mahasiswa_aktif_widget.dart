import 'package:flutter/material.dart';
import '../../data/models/mahasiswa_aktif.dart';

class MahasiswaAktifListView extends StatelessWidget {
  final List<MahasiswaAktifModel> listData;
  final VoidCallback onRefresh;

  const MahasiswaAktifListView({
    super.key,
    required this.listData,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: listData.length,
        itemBuilder: (context, index) {
          final item = listData[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person_outline)),
              title: Text(
                item.nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NIM: ${item.nim}'),
                  Text(
                    item.prodi,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              trailing: const Icon(Icons.check_circle, color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}
