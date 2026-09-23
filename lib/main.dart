import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const GlobalUdharKhattaApp());
}

class GlobalUdharKhattaApp extends StatelessWidget {
  const GlobalUdharKhattaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Udhar Khatta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String? _selectedFilepath;

  // گیلری یا فائل مینیجر سے تصویر/فائل اٹھانے کا فنکشن
  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf'],
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFilepath = result.files.single.name;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فائل منتخب ہو گئی: $_selectedFilepath')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فائل منتخب کرنے میں مسئلہ آیا: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Udhar Khatta - Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _pickFile,
              icon: const Icon(Icons.image),
              label: Text(_selectedFilepath ?? 'گیلری سے تصویر منتخب کریں'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Text(
                  _selectedFilepath == null
                      ? 'کوئی پروڈکٹ فائل منتخب نہیں کی گئی'
                      : 'منتخب کردہ فائل: $_selectedFilepath',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
