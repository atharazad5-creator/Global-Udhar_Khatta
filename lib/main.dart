import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlobalPK Digital Khatta',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF8F5F2),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1B4B),
        title: const Text('Smart Distribution', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(icon: const Icon(Icons.sync), onPressed: () {}),
          IconButton(icon: const Icon(Icons.person), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF1E1B4B)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Athar Ali',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text('Your Business', style: TextStyle(color: Colors.white70, fontSize: 14)),
                  SizedBox(height: 8),
                  Text('GlobalPK Digital Khatta', style: TextStyle(color: Colors.amberAccent, fontSize: 12)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('My Outlets'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.inventory_2),
              title: const Text('Planed Outlets'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.alt_route),
              title: const Text('Routes'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Products'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductsScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Recoveries'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text('Sale Orders'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Log out', style: TextStyle(color: Colors.red)),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Daily Sale Order Summary",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E1B4B)),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Route Date:    ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text("2026-09-23", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Text("Route Day:     ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text("Wednesday", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Route Name:  ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text("View ▸", style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                "📍 Route Summary",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E1B4B)),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildSummaryCard("Planed Outlets", "0", Icons.alt_route)),
                const SizedBox(width: 8),
                Expanded(child: _buildSummaryCard("Productive Outlets", "13", Icons.check_circle)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildSummaryCard("Un Planed Outlets", "13", Icons.near_me_disabled)),
                const SizedBox(width: 8),
                Expanded(child: _buildSummaryCard("Productivity %", "0", Icons.pie_chart)),
              ],
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "📋 Today Summary",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E1B4B)),
              ),
            ),
            const SizedBox(height: 8),
            _buildWideSummaryCard("Sale Order Value", "36052.9", Icons.shopping_cart),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildSummaryCard("InStock Order", "36052.9", Icons.done_all)),
                const SizedBox(width: 8),
                Expanded(child: _buildSummaryCard("OutStock Order", "0.0", Icons.remove_shopping_cart)),
              ],
            ),
            const SizedBox(height: 8),
            _buildWideSummaryCard("Today Recovery", "0.0", Icons.account_balance_wallet),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: const Icon(Icons.qr_code_scanner, color: Colors.white),
        onPressed: () {},
      ),
    );
  }

  static Widget _buildSummaryCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 4, spreadRadius: 1)],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo.shade300, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildWideSummaryCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 4, spreadRadius: 1)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.indigo.shade300, size: 28),
              const SizedBox(width: 10),
              Text(title, style: const TextStyle(fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w500)),
            ],
          ),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
        ],
      ),
    );
  }
}

// ================= PRODUCTS SCREEN =================
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Map<String, dynamic>> products = [];
  List<Map<String, dynamic>> filteredProducts = [];

  final TextEditingController searchController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cartonRateController = TextEditingController();
  final TextEditingController packetRateController = TextEditingController();
  final TextEditingController cartonStockController = TextEditingController();
  final TextEditingController packetStockController = TextEditingController();
  final TextEditingController imagePathController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadProducts();
    searchController.addListener(_filterProducts);
  }

  @override
  void dispose() {
    searchController.dispose();
    nameController.dispose();
    cartonRateController.dispose();
    packetRateController.dispose();
    cartonStockController.dispose();
    packetStockController.dispose();
    imagePathController.dispose();
    super.dispose();
  }

  Future<void> loadProducts() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? savedList = prefs.getStringList('globalpk_permanent_products_v2');
    if (savedList != null) {
      setState(() {
        products = savedList.map((item) {
          final parts = item.split('||');
          return {
            'name': parts.isNotEmpty ? parts[0] : '',
            'cartonRate': parts.length > 1 ? parts[1] : '0',
            'packetRate': parts.length > 2 ? parts[2] : '0',
            'cartonStock': parts.length > 3 ? parts[3] : '0',
            'packetStock': parts.length > 4 ? parts[4] : '0',
            'imagePath': parts.length > 5 ? parts[5] : '',
          };
        }).toList();
        filteredProducts = products;
      });
    }
  }

  Future<void> saveProducts() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stringList = products.map((p) => 
      "${p['name']}||${p['cartonRate']}||${p['packetRate']}||${p['cartonStock']}||${p['packetStock']}||${p['imagePath']}"
    ).toList();
    await prefs.setStringList('globalpk_permanent_products_v2', stringList);
  }

  void _filterProducts() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredProducts = products.where((p) {
        return p['name'].toLowerCase().contains(query);
      }).toList();
    });
  }

  // Voice/Text Search Dialog
  void startVoiceSearch() {
    final TextEditingController voiceController = TextEditingController(text: searchController.text);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Voice / Text Search'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Speak or type product name:'),
            const SizedBox(height: 10),
            TextField(
              controller: voiceController,
              decoration: const InputDecoration(
                hintText: 'Type search keyword...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.mic, color: Colors.indigo),
              ),
              autofocus: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E1B4B)),
            onPressed: () {
              setState(() {
                searchController.text = voiceController.text;
              });
              Navigator.pop(context);
            },
            child: const Text('Apply', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // Full Image Preview Dialog
  void showFullImage(String imagePath, String productName) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    productName,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E1B4B)),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: imagePath.isNotEmpty && File(imagePath).existsSync()
                        ? Image.file(
                            File(imagePath),
                            height: 280,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : imagePath.startsWith('http')
                            ? Image.network(
                                imagePath,
                                height: 280,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (c, e, s) => const SizedBox(
                                  height: 200,
                                  child: Center(child: Text('Invalid Image Path', style: TextStyle(color: Colors.red))),
                                ),
                              )
                            : const SizedBox(
                                height: 200,
                                child: Center(
                                  child: Text('No Local Image Found', style: TextStyle(color: Colors.grey)),
                                ),
                              ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openProductDialog({int? editIndex}) {
    if (editIndex != null) {
      nameController.text = filteredProducts[editIndex]['name'];
      cartonRateController.text = filteredProducts[editIndex]['cartonRate'];
      packetRateController.text = filteredProducts[editIndex]['packetRate'];
      cartonStockController.text = filteredProducts[editIndex]['cartonStock'];
      packetStockController.text = filteredProducts[editIndex]['packetStock'];
      imagePathController.text = filteredProducts[editIndex]['imagePath'];
    } else {
      nameController.clear();
      cartonRateController.clear();
      packetRateController.clear();
      cartonStockController.clear();
      packetStockController.clear();
      imagePathController.clear();
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(editIndex == null ? 'Add New Product' : 'Edit Product'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Product Name'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: cartonRateController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Carton Rate'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: packetRateController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Packet Rate'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: cartonStockController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Carton Stock'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: packetStockController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Packet Stock'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: imagePathController,
                  decoration: const InputDecoration(
                    labelText: 'Image Storage Path / Local File Path',
                    hintText: '/storage/emulated/0/Download/image.jpg',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E1B4B)),
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  setState(() {
                    final newProduct = {
                      'name': nameController.text,
                      'cartonRate': cartonRateController.text.isEmpty ? '0' : cartonRateController.text,
                      'packetRate': packetRateController.text.isEmpty ? '0' : packetRateController.text,
                      'cartonStock': cartonStockController.text.isEmpty ? '0' : cartonStockController.text,
                      'packetStock': packetStockController.text.isEmpty ? '0' : packetStockController.text,
                      'imagePath': imagePathController.text,
                    };

                    if (editIndex == null) {
                      products.add(newProduct);
                    } else {
                      final origIndex = products.indexWhere((p) => p['name'] == filteredProducts[editIndex]['name']);
                      if (origIndex != -1) {
                        products[origIndex] = newProduct;
                      }
                    }
                    _filterProducts();
                  });
                  saveProducts();
                  Navigator.pop(context);
                }
              },
              child: Text(editIndex == null ? 'Save' : 'Update', style: const TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1B4B),
        title: const Text('Products', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search product by name...',
                      prefixIcon: const Icon(Icons.search, color: Colors.indigo),
                      suffixIcon: searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () => searchController.clear(),
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1B4B),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.mic, color: Colors.white),
                    onPressed: startVoiceSearch,
                    tooltip: 'Voice / Text Search',
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(
                    child: Text(
                      'No Products Found.\nTap + to add a new product.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredProducts.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      final p = filteredProducts[index];
                      return GestureDetector(
                        onLongPress: () => openProductDialog(editIndex: index),
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () => showFullImage(p['imagePath'], p['name']),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            margin: const EdgeInsets.only(right: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade200,
                                              borderRadius: BorderRadius.circular(6),
                                              border: Border.all(color: Colors.indigo.shade200),
                                            ),
                                            child: p['imagePath'].isNotEmpty
                                                ? ClipRRect(
                                                    borderRadius: BorderRadius.circular(6),
                                                    child: Image.file(
                                                      File(p['imagePath']),
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context, error, stackTrace) =>
                                                          const Icon(Icons.image, size: 20, color: Colors.grey),
                                                    ),
                                                  )
                                                : const Icon(Icons.image, size: 20, color: Colors.grey),
                                          ),
                                        ),
                                        Text(
                                          p['name'],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF1E1B4B),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Text(
                                      '(Long press to edit)',
                                      style: TextStyle(fontSize: 10, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const Divider(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Carton Rate: Rs ${p['cartonRate']}',
                                        style: const TextStyle(fontSize: 13, color: Colors.black87)),
                                    Text('Packet Rate: Rs ${p['packetRate']}',
                                        style: const TextStyle(fontSize: 13, color: Colors.black87)),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Carton Stock: ${p['cartonStock']}',
                                        style: const TextStyle(fontSize: 13, color: Colors.indigo, fontWeight: FontWeight.w500)),
                                    Text('Packet Stock: ${p['packetStock']}',
                                        style: const TextStyle(fontSize: 13, color: Colors.indigo, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () => openProductDialog(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
