import 'package:material_ui/material_ui.dart';

import 'package:myportofolio_mobile/models/volunteering.dart';

class VolunteeringDetailScreen extends StatelessWidget {
  final Volunteering volunteering;

  const VolunteeringDetailScreen({super.key, required this.volunteering});

  String _formatDate(DateTime? date) {
    if (date == null) return 'Belum diisi';

    return '${date.day.toString().padLeft(2, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Volunteering Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (volunteering.thumbnail.isNotEmpty) ...[
              Image.network(
                volunteering.thumbnail,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Text('Gambar gagal dimuat.');
                },
              ),
              const SizedBox(height: 16),
            ],

            Text(
              volunteering.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Text(
              'Deskripsi',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(volunteering.description),
            const SizedBox(height: 16),

            Text(
              'Kategori',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(volunteering.category),
            const SizedBox(height: 16),

            Text(
              'Tanggal Mulai',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(_formatDate(volunteering.startedAt)),
            const SizedBox(height: 16),

            Text(
              'Tanggal Selesai',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(_formatDate(volunteering.endedAt)),
            const SizedBox(height: 16),

            Text('Status', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(volunteering.isOngoing ? 'Masih berlangsung' : 'Selesai'),
            const SizedBox(height: 16),

            Text(
              'Jumlah Stars',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${volunteering.starCount}'),
          ],
        ),
      ),
    );
  }
}
