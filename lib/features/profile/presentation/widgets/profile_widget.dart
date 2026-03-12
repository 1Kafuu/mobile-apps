import 'package:flutter/material.dart';
import '../../data/models/profile.dart';

class ProfileDetailView extends StatelessWidget {
  final ProfileModel profile;

  const ProfileDetailView({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(profile.fotoUrl),
          ),
          const SizedBox(height: 24),
          _buildInfoTile(Icons.person, 'Nama Lengkap', profile.nama),
          _buildInfoTile(Icons.badge, 'NIM', profile.nim),
          _buildInfoTile(Icons.email, 'Email Student', profile.email),
          _buildInfoTile(Icons.school, 'Jurusan', profile.jurusan),
          const SizedBox(height: 40),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            label: const Text('Edit Profil'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }
}