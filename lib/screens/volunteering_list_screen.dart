import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

import 'package:myportofolio_mobile/models/volunteering.dart';
import 'package:myportofolio_mobile/screens/volunteering_detail_screen.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class VolunteeringListScreen extends StatefulWidget {
  const VolunteeringListScreen({super.key});

  @override
  State<VolunteeringListScreen> createState() => _VolunteeringListScreenState();
}

class _VolunteeringListScreenState extends State<VolunteeringListScreen> {
  late Future<List<Volunteering>> _volunteeringFuture;

  @override
  void initState() {
    super.initState();
    _volunteeringFuture = context.read<ApiClient>().getVolunteering();
  }

  Future<void> _reload() async {
    final future = context.read<ApiClient>().getVolunteering();

    setState(() {
      _volunteeringFuture = future;
    });

    await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Volunteering')),
      drawer: const LeftDrawer(),
      body: FutureBuilder<List<Volunteering>>(
        future: _volunteeringFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Gagal mengambil data volunteering:\n${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: _reload,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
            );
          }

          final volunteeringList = snapshot.data ?? const <Volunteering>[];

          if (volunteeringList.isEmpty) {
            return RefreshIndicator(
              onRefresh: _reload,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 180),
                  Center(child: Text('Belum ada data volunteering.')),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _reload,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: volunteeringList.length,
              itemBuilder: (context, index) {
                final volunteering = volunteeringList[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(
                      volunteering.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Kategori: ${volunteering.category}'),
                          const SizedBox(height: 4),
                          Text(
                            volunteering.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VolunteeringDetailScreen(
                            volunteering: volunteering,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
