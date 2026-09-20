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
        return const OutletsScreen(); // اپ ڈیٹ شدہ آؤٹ لیٹس سکرین
      case 'Planed Outlets':
        return const Center(child: Text('پلانڈ آؤٹ لیٹس', style: TextStyle(fontSize: 20)));
      case 'Routes':
        return const Center(child: Text('روٹس (Routes)', style: TextStyle(fontSize: 20)));
      case 'Products':
        return const ProductsScreen(); // پروڈکٹس سکرین
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
                child: Text(
                  'G',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
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
              decoration: const BoxDecoration(
                color: Color(0xFF004080),
              ),
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
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: isLogout ? Colors.red : Colors.black87,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        if (isLogout) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('لاگ آؤٹ ہو گئے ہیں')),
          );
        } else {
          setState(() {
            _selectedTitle = title;
          });
        }
      },
    );
  }
}

// 1. آؤٹ لیٹس سکرین (جس میں پلس کا بٹن اور دکان دار کا انفارمیشن فارم ہے)
class OutletsScreen extends StatefulWidget {
  const OutletsScreen({Key? key}) : super(key: key);

  @override
  _OutletsScreenState createState() => _OutletsScreenState();
}

class _OutletsScreenState extends State<OutletsScreen> {
  final List<Map<String, dynamic>> _outlets = [
    {'name': 'المدینہ جنرل سٹور، کراچی', 'owner': 'محمد علی', 'phone': '03001234567'},
    {'name': 'البحرین سپر مارکیٹ', 'owner': 'احمد رضا', 'phone': '03219876543'},
  ];

  void _addNewOutletDialog() {
    final nameController = TextEditingController();
    final ownerController = TextEditingController();
    final phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('نئی دکان (آؤٹ لیٹ) شامل کریں'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nameController, decoration: const InputDecoration(labelText: 'دکان کا نام')),
                TextField(controller: ownerController, decoration: const InputDecoration(labelText: 'دکان دار کا نام')),
                TextField(controller: phoneController, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'موبائل نمبر')),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('منسوخ'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF004080)),
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  setState(() {
                    _outlets.add({
                      'name': nameController.text,
                      'owner': ownerController.text,
                      'phone': phoneController.text,
                    });
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('محفوظ کریں', style: TextStyle(color: Colors.white)),
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
        itemCount: _outlets.length,
        itemBuilder: (context, index) {
          final outlet = _outlets[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              title: Text(outlet['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('مالک: ${outlet['owner']} | فون: ${outlet['phone']}'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                onPressed: () {
                  // دکان سلیکٹ کرنے پر پروڈکٹ/آرڈر پیج کھل جائے گا
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OutletOrderScreen(outletName: outlet['name']),
                    ),
                  );
                },
                child: const Text('آرڈر لیں'),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF004080),
        onPressed: _addNewOutletDialog,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// 2. دکان کا آرڈر اور پروڈکٹ سکرین (جو پچھلے سٹیپ میں بنائی گئی تھی)
class OutletOrderScreen extends StatelessWidget {
  final String outletName;
  const OutletOrderScreen({Key? key, required this.outletName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {'title': '10760 Vista Detergent Powder 18 Gm*240 (Rs:10)', 'cottonRate': 2244.0, 'packetRate': 9.35, 'cottonStock': 9.0, 'packetStock': 108.0, 'retail': 10.0},
      {'title': '10761 Vista Detergent Powder 85 Gm*66 (Rs:50)', 'cottonRate': 3036.0, 'packetRate': 46.0, 'cottonStock': 27.0, 'packetStock': 24.0, 'retail': 50.0},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004080),
        title: Text('آرڈر: $outletName', style: const TextStyle(color: Colors.white, fontSize: 16)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
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
                        Text(p['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
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
                            const Text('Counter Unit Price: 0.0', style: TextStyle(fontSize: 11, color: Colors.black54)),
                            Text('Retail: ${p['retail']}', style: const TextStyle(fontSize: 11, color: Colors.red, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// 3. مرکزی پروڈکٹس سکرین (مین مینو کے لیے)
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('پروڈکٹس مینجمنٹ سکرین', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
