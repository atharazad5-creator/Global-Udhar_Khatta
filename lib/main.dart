import 'package:flutter/material.dart';

void main() {
  runApp(const GlobalApp());
}

class GlobalApp extends StatelessWidget {
  const GlobalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'گلوبل ڈیجیٹل کھاتہ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Segoe UI',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedTitle = 'My Outlets';

  Widget _getSelectedScreen() {
    switch (_selectedTitle) {
      case 'Home':
        return _buildHomeDashboard();
      case 'My Outlets':
        return const OutletsScreen();
      case 'Planed Outlets':
        return const Center(child: Text('پلانڈ آؤٹ لیٹس', style: TextStyle(fontSize: 20)));
      case 'Routes':
        return const Center(child: Text('روٹس (Routes)', style: TextStyle(fontSize: 20)));
      case 'Products':
        return const ProductsScreen();
      case 'Recoveries':
        return const Center(child: Text('ریکوریز (Recoveries)', style: TextStyle(fontSize: 20)));
      case 'Sale Orders':
        return const Center(child: Text('سیل آرڈرز', style: TextStyle(fontSize: 20)));
      case 'Map View':
        return const Center(child: Text('نقشہ (Map View)', style: TextStyle(fontSize: 20)));
      case 'Today Activity Remarks':
        return const Center(child: Text('آج کی سرگرمی اور ریمارکس', style: TextStyle(fontSize: 20)));
      case 'Sale Targets':
        return const Center(child: Text('سیل ٹارگٹس', style: TextStyle(fontSize: 20)));
      case 'Sync Data':
        return const Center(child: Text('ڈیٹا سنک کریں', style: TextStyle(fontSize: 20)));
      case 'Configuration':
        return const Center(child: Text('کنفیگریشن سیٹنگز', style: TextStyle(fontSize: 20)));
      case 'Switch User':
        return const Center(child: Text('یوزر تبدیل کریں', style: TextStyle(fontSize: 20)));
      case 'Visit Log':
        return const Center(child: Text('وزٹ لاگ', style: TextStyle(fontSize: 20)));
      default:
        return _buildHomeDashboard();
    }
  }

  Widget _buildHomeDashboard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue[100]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('خوش آمدید!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF004080))),
                SizedBox(height: 8),
                Text('گلوبل ڈیجیٹل کھاتہ سسٹم میں آپ کا خیرمقدم ہے۔ مینو سے مطلوبہ آپشن منتخب کریں۔', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004080),
        title: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                color: Color(0xFFFF9900),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text('G', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Athar Ali', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Your Business', style: TextStyle(fontSize: 10, color: Colors.white70)),
              ],
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF004080)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    backgroundColor: Color(0xFFFF9900),
                    child: Text('G', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 10),
                  Text('Athar Ali', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Your Business', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
            _drawerItem(Icons.home, 'Home'),
            _drawerItem(Icons.store, 'My Outlets'),
            _drawerItem(Icons.bookmark_border, 'Planed Outlets'),
            _drawerItem(Icons.alt_route, 'Routes'),
            _drawerItem(Icons.shopping_bag_outlined, 'Products'),
            _drawerItem(Icons.credit_card, 'Recoveries'),
            _drawerItem(Icons.local_shipping_outlined, 'Sale Orders'),
            _drawerItem(Icons.location_on_outlined, 'Map View'),
            _drawerItem(Icons.note_alt_outlined, 'Today Activity Remarks'),
            _drawerItem(Icons.science_outlined, 'Sale Targets'),
            _drawerItem(Icons.cloud_sync_outlined, 'Sync Data'),
            _drawerItem(Icons.settings, 'Configuration'),
            _drawerItem(Icons.person_outline, 'Switch User'),
            _drawerItem(Icons.receipt_long, 'Visit Log'),
            const Divider(),
            _drawerItem(Icons.logout, 'Log out', isLogout: true),
          ],
        ),
      ),
      body: _getSelectedScreen(),
    );
  }

  Widget _drawerItem(IconData icon, String title, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: isLogout ? Colors.red : const Color(0xFF004080)),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, color: isLogout ? Colors.red : Colors.black87),
      ),
      onTap: () {
        Navigator.pop(context);
        if (isLogout) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('لاگ آؤٹ ہو گئے ہیں')));
        } else {
          setState(() {
            _selectedTitle = title;
          });
        }
      },
    );
  }
}

// گلوبل اسٹوریج
class AppData {
  static final List<Map<String, dynamic>> globalOutlets = [
    {
      'name': 'المدینہ جنرل سٹور',
      'owner': 'محمد علی',
      'phone': '03001234567',
      'area': 'صدر',
      'street': 'گلی نمبر 3',
      'city': 'کراچی'
    },
    {
      'name': 'البحرین سپر مارکیٹ',
      'owner': 'احمد رضا',
      'phone': '03219876543',
      'area': 'لیاقت آباد',
      'street': 'مین بازار',
      'city': 'کراچی'
    },
  ];

  static final List<Map<String, dynamic>> globalProducts = [
    {
      'title': 'Vista Detergent Powder',
      'size': '18 Gm * 240',
      'cottonRate': 2244.0,
      'packetRate': 9.35,
      'cottonStock': 9.0,
      'packetStock': 108.0,
      'counterUnitPrice': 0.0,
      'retail': 10.0,
    },
    {
      'title': 'Vista Detergent Powder',
      'size': '85 Gm * 66',
      'cottonRate': 3036.0,
      'packetRate': 46.0,
      'cottonStock': 27.0,
      'packetStock': 24.0,
      'counterUnitPrice': 0.0,
      'retail': 50.0,
    },
  ];
}

// 1. آؤٹ لیٹس سکرین (ایڈٹ آپشن کے ساتھ)
class OutletsScreen extends StatefulWidget {
  const OutletsScreen({Key? key}) : super(key: key);

  @override
  _OutletsScreenState createState() => _OutletsScreenState();
}

class _OutletsScreenState extends State<OutletsScreen> {
  void _openOutletDialog({Map<String, dynamic>? outlet, int? index}) {
    final nameController = TextEditingController(text: outlet?['name'] ?? '');
    final ownerController = TextEditingController(text: outlet?['owner'] ?? '');
    final phoneController = TextEditingController(text: outlet?['phone'] ?? '');
    final areaController = TextEditingController(text: outlet?['area'] ?? '');
    final streetController = TextEditingController(text: outlet?['street'] ?? '');
    final cityController = TextEditingController(text: outlet?['city'] ?? '');

    bool isEditing = outlet != null;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEditing ? 'دکان کی تفصیلات میں ترمیم کریں' : 'نئی دکان (آؤٹ لیٹ) شامل کریں'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nameController, decoration: const InputDecoration(labelText: 'دکان کا نام')),
                TextField(controller: ownerController, decoration: const InputDecoration(labelText: 'دکاندار کا نام')),
                TextField(controller: phoneController, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'موبائل نمبر')),
                TextField(controller: areaController, decoration: const InputDecoration(labelText: 'ایریا (Area)')),
                TextField(controller: streetController, decoration: const InputDecoration(labelText: 'اسٹریٹ / گلی')),
                TextField(controller: cityController, decoration: const InputDecoration(labelText: 'شہر (City)')),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('منسوخ')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF004080)),
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  setState(() {
                    final newOutletData = {
                      'name': nameController.text,
                      'owner': ownerController.text,
                      'phone': phoneController.text,
                      'area': areaController.text,
                      'street': streetController.text,
                      'city': cityController.text,
                    };
                    if (isEditing && index != null) {
                      AppData.globalOutlets[index] = newOutletData;
                    } else {
                      AppData.globalOutlets.add(newOutletData);
                    }
                  });
                  Navigator.pop(context);
                }
              },
              child: Text(isEditing ? 'اپ ڈیٹ کریں' : 'محفوظ کریں', style: const TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: AppData.globalOutlets.length,
        itemBuilder: (context, index) {
          final outlet = AppData.globalOutlets[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              title: Text(outlet['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('مالک: ${outlet['owner']} | فون: ${outlet['phone']}\nایریا: ${outlet['area']}, گلی: ${outlet['street']}, شہر: ${outlet['city']}'),
              isThreeLine: true,
              // دکان پر کلک کرنے سے یا ایڈٹ بٹن سے ایڈٹ فارم کھل جائے گا
              onTap: () => _openOutletDialog(outlet: outlet, index: index),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => _openOutletDialog(outlet: outlet, index: index),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OutletOrderScreen(outletName: outlet['name']),
                        ),
                      );
                    },
                    child: const Text('آرڈر لیں'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF004080),
        onPressed: () => _openOutletDialog(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// 2. دکان کا آرڈر لینے والا صفحہ
class OutletOrderScreen extends StatefulWidget {
  final String outletName;
  const OutletOrderScreen({Key? key, required this.outletName}) : super(key: key);

  @override
  _OutletOrderScreenState createState() => _OutletOrderScreenState();
}

class _OutletOrderScreenState extends State<OutletOrderScreen> {
  final Map<int, Map<String, TextEditingController>> _controllers = {};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < AppData.globalProducts.length; i++) {
      _controllers[i] = {
        'cotton': TextEditingController(text: '0'),
        'packet': TextEditingController(text: '0'),
      };
    }
  }

  @override
  void dispose() {
    for (var entry in _controllers.values) {
      entry['cotton']?.dispose();
      entry['packet']?.dispose();
    }
    super.dispose();
  }

  double _calculateTotalAmount() {
    double total = 0.0;
    for (int i = 0; i < AppData.globalProducts.length; i++) {
      final p = AppData.globalProducts[i];
      double cottonQty = double.tryParse(_controllers[i]?['cotton']?.text ?? '0') ?? 0.0;
      double packetQty = double.tryParse(_controllers[i]?['packet']?.text ?? '0') ?? 0.0;
      
      double cottonRate = p['cottonRate'] ?? 0.0;
      double packetRate = p['packetRate'] ?? 0.0;

      total += (cottonQty * cottonRate) + (packetQty * packetRate);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004080),
        title: Text('آرڈر: ${widget.outletName}', style: const TextStyle(color: Colors.white, fontSize: 15)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: AppData.globalProducts.length,
              itemBuilder: (context, index) {
                final p = AppData.globalProducts[index];
                final cottonController = _controllers[index]!['cotton']!;
                final packetController = _controllers[index]!['packet']!;

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              color: Colors.grey[200],
                              child: const Icon(Icons.inventory_2, color: Colors.grey, size: 20),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${p['title']} (${p['size']})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Cotton Rate: ${p['cottonRate']}', style: const TextStyle(fontSize: 11)),
                                      Text('Packet Rate: ${p['packetRate']}', style: const TextStyle(fontSize: 11)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Retail: ${p['retail']}', style: const TextStyle(fontSize: 11, color: Colors.red, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: cottonController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'آرڈر کاٹن (Qty)',
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (val) {
                                  setState(() {});
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: packetController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'آرڈر پیکٹ (Qty)',
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (val) {
                                  setState(() {});
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('کل بل رقم (Total Payment):', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF004080))),
                Text(
                  'Rs: ${_calculateTotalAmount().toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 3. پروڈکٹس سکرین (ایڈٹ آپشن کے ساتھ)
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void _openProductDialog({Map<String, dynamic>? product, int? index}) {
    final titleController = TextEditingController(text: product?['title'] ?? '');
    final sizeController = TextEditingController(text: product?['size'] ?? '');
    final cottonRateController = TextEditingController(text: product?['cottonRate']?.toString() ?? '');
    final packetRateController = TextEditingController(text: product?['packetRate']?.toString() ?? '');
    final cottonStockController = TextEditingController(text: product?['cottonStock']?.toString() ?? '');
    final packetStockController = TextEditingController(text: product?['packetStock']?.toString() ?? '');
    final counterUnitPriceController = TextEditingController(text: product?['counterUnitPrice']?.toString() ?? '');
    final retailController = TextEditingController(text: product?['retail']?.toString() ?? '');

    bool isEditing = product != null;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEditing ? 'پروڈکٹ میں ترمیم کریں' : 'نئی پروڈکٹ شامل کریں'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: titleController, decoration: const InputDecoration(labelText: 'پروڈکٹ کا نام')),
                TextField(controller: sizeController, decoration: const InputDecoration(labelText: 'سائز (Size) مثلاً 18 Gm * 240')),
                TextField(controller: cottonRateController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'کارٹن ریٹ (Cotton Rate)')),
                TextField(controller: packetRateController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'پیکٹ ریٹ (Packet Rate)')),
                TextField(controller: cottonStockController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'کارٹن اسٹاک (Cotton Stock)')),
                TextField(controller: packetStockController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'پیکٹ اسٹاک (Packet Stock)')),
                TextField(controller: counterUnitPriceController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'کاؤنٹر یونٹ پرائس')),
                TextField(controller: retailController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'ریٹیل قیمت (Retail)')),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('منسوخ')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF004080)),
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  setState(() {
                    final newProductData = {
                      'title': titleController.text,
                      'size': sizeController.text,
                      'cottonRate': double.tryParse(cottonRateController.text) ?? 0.0,
                      'packetRate': double.tryParse(packetRateController.text) ?? 0.0,
                      'cottonStock': double.tryParse(cottonStockController.text) ?? 0.0,
                      'packetStock': double.tryParse(packetStockController.text) ?? 0.0,
                      'counterUnitPrice': double.tryParse(counterUnitPriceController.text) ?? 0.0,
                      'retail': double.tryParse(retailController.text) ?? 0.0,
                    };
                    if (isEditing && index != null) {
                      AppData.globalProducts[index] = newProductData;
                    } else {
                      AppData.globalProducts.add(newProductData);
                    }
                  });
                  Navigator.pop(context);
                }
              },
              child: Text(isEditing ? 'اپ ڈیٹ کریں' : 'محفوظ کریں', style: const TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: AppData.globalProducts.length,
        itemBuilder: (context, index) {
          final p = AppData.globalProducts[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: InkWell(
              // پروڈکٹ پر کہیں بھی کلک کرنے سے ایڈٹ کھل جائے گا
              onTap: () => _openProductDialog(product: p, index: index),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey[200],
                      child: const Icon(Icons.inventory_2, color: Colors.grey),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text('${p['title']} (${p['size']})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
                              IconButton(
                                icon: const Icon(Icons.edit, size: 20, color: Colors.blue),
                                onPressed: () => _openProductDialog(product: p, index: index),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Cotton Rate: ${p['cottonRate']}', style: const TextStyle(fontSize: 11)),
                              Text('Packet Rate: ${p['packetRate']}', style: const TextStyle(fontSize: 11)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Cotton Stock: ${p['cottonStock']}', style: const TextStyle(fontSize: 11, color: Colors.green)),
                              Text('Packet Stock: ${p['packetStock']}', style: const TextStyle(fontSize: 11, color: Colors.green)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Counter Unit Price: ${p['counterUnitPrice']}', style: const TextStyle(fontSize: 11, color: Colors.black54)),
                              Text('Retail: ${p['retail']}', style: const TextStyle(fontSize: 11, color: Colors.red, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF004080),
        onPressed: () => _openProductDialog(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
