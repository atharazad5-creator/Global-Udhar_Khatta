import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        return const SaleOrdersScreen();
      case 'Map View':
        return const Center(child: Text('نقشہ (Map View)', style: TextStyle(fontSize: 20)));
      case 'Today Activity Remarks':
        return const SaleOrdersScreen();
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

// گلوبل ڈیٹا اسٹوریج
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
      'cottonStock': 50.0,
      'packetStock': 108.0,
      'counterUnitPrice': 0.0,
      'retail': 10.0,
    },
    {
      'title': 'Vista Detergent Powder',
      'size': '85 Gm * 66',
      'cottonRate': 3036.0,
      'packetRate': 46.0,
      'cottonStock': 40.0,
      'packetStock': 24.0,
      'counterUnitPrice': 0.0,
      'retail': 50.0,
    },
  ];

  static final List<Map<String, dynamic>> savedOrders = [];
}

// آؤٹ لیٹس سکرین
class OutletsScreen extends StatefulWidget {
  const OutletsScreen({Key? key}) : super(key: key);

  @override
  _OutletsScreenState createState() => _OutletsScreenState();
}

class _OutletsScreenState extends State<OutletsScreen> {
  String searchQuery = '';

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
                TextField(controller: nameController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'دکان کا نام')),
                TextField(controller: ownerController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'دکاندار کا نام')),
                TextField(controller: phoneController, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'موبائل نمبر')),
                TextField(controller: areaController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'ایریا (Area)')),
                TextField(controller: streetController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'اسٹریٹ / گلی')),
                TextField(controller: cityController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'شہر (City)')),
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
    var filteredOutlets = AppData.globalOutlets.where((o) {
      final name = o['name'].toLowerCase();
      final owner = o['owner'].toLowerCase();
      final query = searchQuery.toLowerCase();
      return name.contains(query) || owner.contains(query);
    }).toList();

    filteredOutlets.sort((a, b) => a['name'].compareTo(b['name']));

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'دکان یا دکاندار کے نام سے تلاش کریں...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (val) {
                setState(() {
                  searchQuery = val;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: filteredOutlets.length,
              itemBuilder: (context, index) {
                final outlet = filteredOutlets[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    title: Text(outlet['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('مالک: ${outlet['owner']} | فون: ${outlet['phone']}\nایریا: ${outlet['area']}, گلی: ${outlet['street']}, شہر: ${outlet['city']}'),
                    isThreeLine: true,
                    onTap: () => _openOutletDialog(outlet: outlet, index: AppData.globalOutlets.indexOf(outlet)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _openOutletDialog(outlet: outlet, index: AppData.globalOutlets.indexOf(outlet)),
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF004080),
        onPressed: () => _openOutletDialog(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// دکان کا آرڈر لینے والا صفحہ (جس سے اسٹاک بھی مائنس ہوگا)
class OutletOrderScreen extends StatefulWidget {
  final String outletName;
  final Map<String, dynamic>? existingOrder;
  final int? orderIndex;

  const OutletOrderScreen({Key? key, required this.outletName, this.existingOrder, this.orderIndex}) : super(key: key);

  @override
  _OutletOrderScreenState createState() => _OutletOrderScreenState();
}

class _OutletOrderScreenState extends State<OutletOrderScreen> {
  final Map<int, Map<String, TextEditingController>> _controllers = {};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < AppData.globalProducts.length; i++) {
      String initialCotton = '0';
      String initialPacket = '0';

      if (widget.existingOrder != null) {
        final items = widget.existingOrder!['items'] as List;
        final pName = AppData.globalProducts[i]['title'];
        final pSize = AppData.globalProducts[i]['size'];
        for (var item in items) {
          if (item['title'] == pName && item['size'] == pSize) {
            initialCotton = item['cotton'].toString();
            initialPacket = item['packet'].toString();
          }
        }
      }

      _controllers[i] = {
        'cotton': TextEditingController(text: initialCotton),
        'packet': TextEditingController(text: initialPacket),
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

  void _saveOrder() {
    List<Map<String, dynamic>> orderedItems = [];
    for (int i = 0; i < AppData.globalProducts.length; i++) {
      double cottonQty = double.tryParse(_controllers[i]?['cotton']?.text ?? '0') ?? 0.0;
      double packetQty = double.tryParse(_controllers[i]?['packet']?.text ?? '0') ?? 0.0;

      if (cottonQty > 0 || packetQty > 0) {
        final p = AppData.globalProducts[i];
        orderedItems.add({
          'title': p['title'],
          'size': p['size'],
          'cotton': cottonQty,
          'packet': packetQty,
          'total': (cottonQty * p['cottonRate']) + (packetQty * p['packetRate']),
        });

        // اسٹاک میں سے مقدار مائنس کریں
        setState(() {
          p['cottonStock'] = (p['cottonStock'] ?? 0.0) - cottonQty;
          p['packetStock'] = (p['packetStock'] ?? 0.0) - packetQty;
        });
      }
    }

    if (orderedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('براہ کرم کم از کم ایک پروڈکٹ کی مقدار درج کریں')));
      return;
    }

    setState(() {
      final newOrderData = {
        'outletName': widget.outletName,
        'date': DateTime.now().toString().substring(0, 16),
        'items': orderedItems,
        'grandTotal': _calculateTotalAmount(),
      };

      if (widget.existingOrder != null && widget.orderIndex != null) {
        AppData.savedOrders[widget.orderIndex!] = newOrderData;
      } else {
        AppData.savedOrders.add(newOrderData);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('آرڈر کامیابی سے محفوظ ہو گیا ہے اور اسٹاک اپ ڈیٹ ہو گیا ہے!')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004080),
        title: Text(widget.existingOrder != null ? 'ترمیم آرڈر: ${widget.outletName}' : 'آرڈر: ${widget.outletName}', style: const TextStyle(color: Colors.white, fontSize: 15)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.white),
            onPressed: _saveOrder,
            tooltip: 'آرڈر محفوظ کریں',
          ),
        ],
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
                                      Text('Available Stock: C: ${p['cottonStock']} | P: ${p['packetStock']}', style: const TextStyle(fontSize: 11, color: Colors.blue)),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green, padding: const EdgeInsets.symmetric(vertical: 12)),
          onPressed: _saveOrder,
          child: const Text('آرڈر محفوظ کریں', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

// سیل آرڈرز اور ٹوڈے سمری سکرین (تھری ڈاٹس مینو اور ایڈٹ کے ساتھ)
class SaleOrdersScreen extends StatefulWidget {
  const SaleOrdersScreen({Key? key}) : super(key: key);

  @override
  _SaleOrdersScreenState createState() => _SaleOrdersScreenState();
}

class _SaleOrdersScreenState extends State<SaleOrdersScreen> {
  void _handleMenuAction(String action, Map<String, dynamic> order, int index) {
    if (action == 'edit') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OutletOrderScreen(
            outletName: order['outletName'],
            existingOrder: order,
            orderIndex: index,
          ),
        ),
      ).then((_) => setState(() {}));
    } else if (action == 'whatsapp') {
      _sendWhatsAppReminder(order);
    } else if (action == 'payment') {
      _showReminderDialog(context, 'پیمنٹ ریمائنڈر', 'محترم دکاندار، آپ کا بل رقم Rs: ${order['grandTotal']} واجب الادا ہے۔ براہ کرم ادائیگی فرما دیں۔');
    } else if (action == 'invoice') {
      _showInvoiceDialog(context, order);
    } else if (action == 'recovery') {
      _showReminderDialog(context, 'ریکوری نوٹس', 'آپ کی دکان ${order['outletName']} کی ریکوری فالو اپ کے لیے سیٹ کر دی گئی ہے۔');
    }
  }

  void _sendWhatsAppReminder(Map<String, dynamic> order) async {
    final message = 'السلام علیکم! آپ کا آرڈر برائے دکان ${order['outletName']} موصول ہو گیا ہے۔ کل بل رقم: Rs: ${order['grandTotal']}۔ شکریہ!';
    final url = Uri.parse('https://wa.me/?text=${Uri.encodeComponent(message)}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('واٹس ایپ لنک اوپن نہیں ہو سکا')));
    }
  }

  void _showReminderDialog(BuildContext context, String title, String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('بند کریں')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF004080)),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ریماینڈر کامیابی سے ارسال کر دیا گیا')));
            },
            child: const Text('ارسال کریں', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showInvoiceDialog(BuildContext context, Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('انگوائس (Invoice): ${order['outletName']}'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('تاریخ: ${order['date']}'),
              const Divider(),
              ...((order['items'] as List).map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${item['title']} (${item['size']})', style: const TextStyle(fontSize: 12)),
                        Text('Rs: ${item['total']}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ))),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('کل بل:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Rs: ${order['grandTotal'].toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('بند کریں')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppData.savedOrders.isEmpty
          ? const Center(child: Text('آج کا کوئی آرڈر محفوظ نہیں کیا گیا', style: TextStyle(fontSize: 16, color: Colors.grey)))
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: AppData.savedOrders.length,
              itemBuilder: (context, index) {
                final order = AppData.savedOrders[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(order['outletName'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF004080))),
                            Row(
                              children: [
                                Text(order['date'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                PopupMenuButton<String>(
                                  onSelected: (val) => _handleMenuAction(val, order, index),
                                  itemBuilder: (context) => [
                                    const PopupMenuItem(value: 'edit', child: Text('ترمیم کریں (Edit)')),
                                    const PopupMenuItem(value: 'whatsapp', child: Text('واٹس ایپ ریمائنڈر (WhatsApp)')),
                                    const PopupMenuItem(value: 'payment', child: Text('پیمنٹ ریمائنڈر (Payment)')),
                                    const PopupMenuItem(value: 'invoice', child: Text('انگوائس دیکھیں (Invoice)')),
                                    const PopupMenuItem(value: 'recovery', child: Text('ریکوری فالو اپ (Recovery)')),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(),
                        ...((order['items'] as List).map((item) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${item['title']} (${item['size']})', style: const TextStyle(fontSize: 12)),
                                  Text('کاٹن: ${item['cotton']} | پیکٹ: ${item['packet']} (Rs: ${item['total']})', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ))),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('کل بل:', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Rs: ${order['grandTotal'].toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                          ],
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

// پروڈکٹس سکرین
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String searchQuery = '';

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
                TextField(controller: titleController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'پروڈکٹ کا نام')),
                TextField(controller: sizeController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'سائز (Size) مثلاً 18 Gm * 240')),
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

  void _deleteProduct(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تصدیق'),
        content: const Text('کیا آپ واقعی اس پروڈکٹ کو مستقل طور پر ڈیلیٹ کرنا چاہتے ہیں؟'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('نہیں')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              setState(() {
                AppData.globalProducts.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text('ہاں، ڈیلیٹ کریں', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var filteredProducts = AppData.globalProducts.where((p) {
      final title = p['title'].toLowerCase();
      final size = p['size'].toLowerCase();
      final query = searchQuery.toLowerCase();
      return title.contains(query) || size.contains(query);
    }).toList();

    filteredProducts.sort((a, b) => a['title'].compareTo(b['title']));

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'پروڈکٹ کے نام یا سائز سے تلاش کریں...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (val) {
                setState(() {
                  searchQuery = val;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final p = filteredProducts[index];
                final originalIndex = AppData.globalProducts.indexOf(p);

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: InkWell(
                    onTap: () => _openProductDialog(product: p, index: originalIndex),
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
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.edit, size: 20, color: Colors.blue),
                                          onPressed: () => _openProductDialog(product: p, index: originalIndex),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.delete, size: 20, color: Colors.red),
                                          onPressed: () => _deleteProduct(originalIndex),
                                        ),
                                      ],
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF004080),
        onPressed: () => _openProductDialog(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
