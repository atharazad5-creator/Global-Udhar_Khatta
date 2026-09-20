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
  String _selectedTitle = 'Home';

  // مختلف سکرینز کا مواد دکھانے کے لیے فنكشن
  Widget _getSelectedScreen() {
    switch (_selectedTitle) {
      case 'Home':
        return _buildHomeDashboard();
      case 'My Outlets':
        return const Center(child: Text('مائی آؤٹ لیٹس (دکانیں)', style: TextStyle(fontSize: 20)));
      case 'Planed Outlets':
        return const Center(child: Text('پلانڈ آؤٹ لیٹس', style: TextStyle(fontSize: 20)));
      case 'Routes':
        return const Center(child: Text('روٹس (Routes)', style: TextStyle(fontSize: 20)));
      case 'Products':
        return const Center(child: Text('پروڈکٹس کی فہرست', style: TextStyle(fontSize: 20)));
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

  // ہوم ڈیش بورڈ کا منظر
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
        // بائیں طرف گلوبل لوگو اور نام
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
        // دائیں طرف مینو کھولنے کے لیے بٹن (EndDrawer کھلنے کا خودکار ہینڈل)
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // دائیں طرف سے کھلنے والا مینو (EndDrawer)
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

  // مینو کے ہر آئٹم کا ڈیزائن
  Widget IconData(IconData icon, String title) {
    return const Icon(Icons.home);
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
        Navigator.pop(context); // مینو بند کریں
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
