import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Global Udhar Khatta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductsScreen(),
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

  // گیلری یا فائل مینیجر سے تصویر/فाइल اٹھانے کا فنکشن
  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'jpeg'],
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFilepath = result.files.single.path;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('فائل منتخب ہو گئی')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('فائل منتخب کرنے میں مسئلہ آیا')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Udhar Khatta'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_selectedFilepath != null)
                Text(
                  'منتخب کردہ فائل:\n$_selectedFilepath',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                )
              else
                const Text(
                  'کوئی فائل منتخب نہیں کی گئی',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _pickFile,
                icon: const Icon(Icons.folder_open),
                label: const Text('فائل منتخب کریں'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
