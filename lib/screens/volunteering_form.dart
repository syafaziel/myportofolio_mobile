
import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class VolunteeringFormPage extends StatefulWidget {
  const VolunteeringFormPage({super.key});

  @override
  State<VolunteeringFormPage> createState() => _VolunteeringFormPageState();
}

class _VolunteeringFormPageState extends State<VolunteeringFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();

  String _category = 'volunteer';
  bool _isOngoing = true;
  DateTime? _endedAt;

  final List<String> _categories = [
    'internship',
    'research',
    'volunteer',
    'part-time',
    'full-time',
    'freelance',
  ];

  // Mengubah DateTime menjadi format YYYY-MM-DD.
  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  // Membuka date picker untuk memilih tanggal selesai.
  Future<void> _selectEndDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _endedAt ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _endedAt = pickedDate;
      });
    }
  }

  // Menampilkan ringkasan data setelah seluruh input valid.
  void _showSummary() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Volunteering berhasil ditambahkan!'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Nama Kegiatan: ${_titleController.text.trim()}'),
                  const SizedBox(height: 8),
                  Text('Deskripsi: ${_descriptionController.text.trim()}'),
                  const SizedBox(height: 8),
                  Text('Kategori: $_category'),
                  const SizedBox(height: 8),
                  Text(
                    'Thumbnail: ${_thumbnailController.text.trim().isEmpty ? "Tidak ada" : _thumbnailController.text.trim()}',
                  ),
                  const SizedBox(height: 8),
                  Text('Status: ${_isOngoing ? "Masih berlangsung" : "Selesai"}'),
                  const SizedBox(height: 8),
                  Text(
                    'Tanggal Selesai: ${_endedAt == null ? "Belum diisi" : _formatDate(_endedAt!)}',
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Tutup'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _thumbnailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Volunteering Form'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Nama Kegiatan ===
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Nama Kegiatan atau Organisasi',
                    labelText: 'Nama Kegiatan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama kegiatan tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),

              // === Deskripsi ===
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Deskripsi kegiatan volunteering',
                    labelText: 'Deskripsi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Deskripsi tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),

              // === Kategori ===
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Kategori',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _category,
                  items: _categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _category = newValue;
                      });
                    }
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Kategori harus dipilih!';
                    }
                    return null;
                  },
                ),
              ),

              // === Thumbnail ===
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextFormField(
                  controller: _thumbnailController,
                  decoration: InputDecoration(
                    hintText: 'https://example.com/image.jpg',
                    labelText: 'Thumbnail (Opsional)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (value != null && value.trim().isNotEmpty) {
                      final uri = Uri.tryParse(value.trim());

                      if (uri == null ||
                          !uri.hasScheme ||
                          !['http', 'https'].contains(uri.scheme) ||
                          uri.host.isEmpty) {
                        return 'Masukkan URL gambar yang valid!';
                      }
                    }
                    return null;
                  },
                ),
              ),

              // === Status Kegiatan ===
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Kegiatan masih berlangsung'),
                value: _isOngoing,
                onChanged: (bool? value) {
                  setState(() {
                    _isOngoing = value ?? true;

                    if (_isOngoing) {
                      _endedAt = null;
                    }
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),

              // === Tanggal Selesai ===
              if (!_isOngoing)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tanggal Selesai (Opsional)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton.icon(
                        onPressed: _selectEndDate,
                        icon: const Icon(Icons.calendar_today),
                        label: Text(
                          _endedAt == null
                              ? 'Pilih Tanggal'
                              : _formatDate(_endedAt!),
                        ),
                      ),
                    ],
                  ),
                ),

              // === Tombol Simpan ===
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.indigo),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                  onPressed: _showSummary,
                  child: const Text(
                    'Simpan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
