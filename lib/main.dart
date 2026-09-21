import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const GlobalApp());
}

class AppDataModel extends ChangeNotifier {
  final List<Map<String, dynamic>> globalOutlets = [
    {
      'name': 'Al-Madina General Store',
      'owner': 'Muhammad Ali',
      'phone': '03001234567',
      'area': 'Saddar',
      'street': 'Street 3',
      'city': 'Karachi',
      'balance': 5000.0,
      'isFirstOrder': false
    },
    {
      'name': 'Bahrain Supermarket',
      'owner': 'Ahmed Raza',
      'phone': '03219876543',
      'area': 'Liaquatabad',
      'street': 'Main Bazaar',
      'city': 'Karachi',
      'balance': 12000.0,
      'isFirstOrder': false
    },
  ];

  final List<Map<String, dynamic>> globalProducts = [
    {
      'title': 'Vista Detergent Powder',
      'size': '18 Gm * 240',
      'cartonRate': 2244.0,
      'packetRate': 9.35,
      'cartonStock': 50.0,
      'packetStock': 108.0,
      'counterUnitPrice': 0.0,
      'retail': 10.0,
    },
    {
      'title': 'Vista Detergent Powder',
      'size': '85 Gm * 66',
      'cartonRate': 3036.0,
      'packetRate': 46.0,
      'cartonStock': 40.0,
      'packetStock': 24.0,
      'counterUnitPrice': 0.0,
      'retail': 50.0,
    },
  ];

  final List<Map<String, dynamic>> savedOrders = [];

  void addOutlet(Map<String, dynamic> outlet) {
    globalOutlets.add(outlet);
    notifyListeners();
  }

  void updateOutlet(int index, Map<String, dynamic> outlet) {
    globalOutlets[index] = outlet;
    notifyListeners();
  }

  void addProduct(Map<String, dynamic> product) {
    globalProducts.add(product);
    notifyListeners();
  }

  void updateProduct(int index, Map<String, dynamic> product) {
    globalProducts[index] = product;
    notifyListeners();
  }

  void deleteProduct(int index) {
    globalProducts.removeAt(index);
    notifyListeners();
  }

  void addOrder(Map<String, dynamic> order) {
    savedOrders.add(order);
    notifyListeners();
  }

  void updateOrder(int index, Map<String, dynamic> order) {
    savedOrders[index] = order;
    notifyListeners();
  }

  void updateStock(int productIndex, double cartonDeduct, double packetDeduct, {bool isAddBack = false}) {
    if (isAddBack) {
      globalProducts[productIndex]['cartonStock'] += cartonDeduct;
      globalProducts[productIndex]['packetStock'] += packetDeduct;
    } else {
      globalProducts[productIndex]['cartonStock'] -= cartonDeduct;
      globalProducts[productIndex]['packetStock'] -= packetDeduct;
    }
    notifyListeners();
  }

  void updateOutletBalance(String outletName, double amountChange) {
    for (var outlet in globalOutlets) {
      if (outlet['name'] == outletName) {
        outlet['balance'] = (outlet['balance'] ?? 0.0) + amountChange;
      }
    }
    notifyListeners();
  }
}

final AppDataModel appData = AppDataModel();

class GlobalApp extends StatelessWidget {
  const GlobalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Digital Khata',
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
      case 'Stock':
        return const ProductsScreen();
      case 'Routes':
        return const Center(child: Text('Routes', style: TextStyle(fontSize: 20)));
      case 'Products':
        return const ProductsScreen();
      case 'Recoveries':
        return const RecoveriesScreen();
      case 'Sale Orders':
        return const SaleOrdersScreen();
      case 'Map View':
        return const Center(child: Text('Map View', style: TextStyle(fontSize: 20)));
      case 'Today Activity Remarks':
        return const SaleOrdersScreen();
      case 'Sale Targets':
        return const Center(child: Text('Sale Targets', style: TextStyle(fontSize: 20)));
      case 'Sync Data':
        return const Center(child: Text('Sync Data', style: TextStyle(fontSize: 20)));
      case 'Configuration':
        return const Center(child: Text('Configuration', style: TextStyle(fontSize: 20)));
      case 'Switch User':
        return const Center(child: Text('Switch User', style: TextStyle(fontSize: 20)));
      case 'Visit Log':
        return const Center(child: Text('Visit Log', style: TextStyle(fontSize: 20)));
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
                Text('Welcome Back!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF004080))),
                SizedBox(height: 8),
                Text('Welcome to Global Digital Khata system. Select an option from the menu.', style: TextStyle(fontSize: 14)),
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
            _drawerItem(Icons.inventory, 'Stock'),
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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logged out successfully')));
        } else {
          setState(() {
            _selectedTitle = title;
          });
        }
      },
    );
  }
}

// Outlets Screen
class OutletsScreen extends StatefulWidget {
  const OutletsScreen({Key? key}) : super(key: key);

  @override
  _OutletsScreenState createState() => _OutletsScreenState();
}

class _OutletsScreenState extends State<OutletsScreen> {
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    appData.addListener(_refreshState);
  }

  @override
  void dispose() {
    appData.removeListener(_refreshState);
    super.dispose();
  }

  void _refreshState() {
    if (mounted) setState(() {});
  }

  void _openOutletDialog({Map<String, dynamic>? outlet, int? index}) {
    final nameController = TextEditingController(text: outlet?['name'] ?? '');
    final ownerController = TextEditingController(text: outlet?['owner'] ?? '');
    final phoneController = TextEditingController(text: outlet?['phone'] ?? '');
    final areaController = TextEditingController(text: outlet?['area'] ?? '');
    final streetController = TextEditingController(text: outlet?['street'] ?? '');
    final cityController = TextEditingController(text: outlet?['city'] ?? '');
    final balanceController = TextEditingController(text: outlet?['balance']?.toString() ?? '0.0');

    bool isEditing = outlet != null;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEditing ? 'Edit Outlet Details' : 'Add New Outlet'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nameController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'Outlet Name')),
                TextField(controller: ownerController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'Shopkeeper Name')),
                TextField(controller: phoneController, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'Mobile Number')),
                TextField(controller: areaController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'Area')),
                TextField(controller: streetController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'Street / Gali')),
                TextField(controller: cityController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'City')),
                TextField(controller: balanceController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Initial Balance / Dues')),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF004080)),
              onPressed: () async {
                if (nameController.text.isNotEmpty) {
                  final newOutletData = {
                    'name': nameController.text,
                    'owner': ownerController.text,
                    'phone': phoneController.text,
                    'area': areaController.text,
                    'street': streetController.text,
                    'city': cityController.text,
                    'balance': double.tryParse(balanceController.text) ?? 0.0,
                    'isFirstOrder': true
                  };
                  if (isEditing && index != null) {
                    appData.updateOutlet(index, newOutletData);
                  } else {
                    appData.addOutlet(newOutletData);
                    String phone = phoneController.text;
                    String msg = 'Welcome ${ownerController.text} to Global Digital Khata! Your store ${nameController.text} has been successfully registered with us. Thank you!';
                    final url = Uri.parse('https://wa.me/$phone?text=${Uri.encodeComponent(msg)}');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    }
                  }
                  Navigator.pop(context);
                }
              },
              child: Text(isEditing ? 'Update' : 'Save', style: const TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var filteredOutlets = appData.globalOutlets.where((o) {
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
                labelText: 'Search by outlet or shopkeeper name...',
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
                final realIndex = appData.globalOutlets.indexOf(outlet);
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    title: Text(outlet['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Owner: ${outlet['owner']} | Phone: ${outlet['phone']}\nArea: ${outlet['area']}, Street: ${outlet['street']}, City: ${outlet['city']}\nBalance: Rs ${outlet['balance']}'),
                    isThreeLine: true,
                    onTap: () => _openOutletDialog(outlet: outlet, index: realIndex),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _openOutletDialog(outlet: outlet, index: realIndex),
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
                          child: const Text('Take Order'),
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

// Outlet Order Screen
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
    for (int i = 0; i < appData.globalProducts.length; i++) {
      String initialCarton = '0';
      String initialPacket = '0';

      if (widget.existingOrder != null) {
        final items = widget.existingOrder!['items'] as List;
        final pName = appData.globalProducts[i]['title'];
        final pSize = appData.globalProducts[i]['size'];
        for (var item in items) {
          if (item['title'] == pName && item['size'] == pSize) {
            initialCarton = item['carton'].toString();
            initialPacket = item['packet'].toString();
          }
        }
      }

      _controllers[i] = {
        'carton': TextEditingController(text: initialCarton),
        'packet': TextEditingController(text: initialPacket),
      };
    }
  }

  @override
  void dispose() {
    for (var entry in _controllers.values) {
      entry['carton']?.dispose();
      entry['packet']?.dispose();
    }
    super.dispose();
  }

  double _calculateTotalAmount() {
    double total = 0.0;
    for (int i = 0; i < appData.globalProducts.length; i++) {
      final p = appData.globalProducts[i];
      double cartonQty = double.tryParse(_controllers[i]?['carton']?.text ?? '0') ?? 0.0;
      double packetQty = double.tryParse(_controllers[i]?['packet']?.text ?? '0') ?? 0.0;
      
      double cartonRate = p['cartonRate'] ?? 0.0;
      double packetRate = p['packetRate'] ?? 0.0;

      total += (cartonQty * cartonRate) + (packetQty * packetRate);
    }
    return total;
  }

  void _saveOrder() async {
    List<Map<String, dynamic>> orderedItems = [];
    
    if (widget.existingOrder != null) {
      final oldItems = widget.existingOrder!['items'] as List;
      for (var oldItem in oldItems) {
        for (int i = 0; i < appData.globalProducts.length; i++) {
          final p = appData.globalProducts[i];
          if (p['title'] == oldItem['title'] && p['size'] == oldItem['size']) {
            appData.updateStock(i, (oldItem['carton'] as num).toDouble(), (oldItem['packet'] as num).toDouble(), isAddBack: true);
          }
        }
      }
    }

    for (int i = 0; i < appData.globalProducts.length; i++) {
      double cartonQty = double.tryParse(_controllers[i]?['carton']?.text ?? '0') ?? 0.0;
      double packetQty = double.tryParse(_controllers[i]?['packet']?.text ?? '0') ?? 0.0;

      if (cartonQty > 0 || packetQty > 0) {
        final p = appData.globalProducts[i];
        
        if ((p['cartonStock'] ?? 0.0) < cartonQty || (p['packetStock'] ?? 0.0) < packetQty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Insufficient stock for ${p['title']}!')));
          return;
        }

        orderedItems.add({
          'title': p['title'],
          'size': p['size'],
          'carton': cartonQty,
          'packet': packetQty,
          'total': (cartonQty * p['cartonRate']) + (packetQty * p['packetRate']),
        });

        appData.updateStock(i, cartonQty, packetQty, isAddBack: false);
      }
    }

    if (orderedItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter quantity for at least one product')));
      return;
    }

    final newOrderData = {
      'outletName': widget.outletName,
      'date': DateTime.now().toString().substring(0, 16),
      'items': orderedItems,
      'grandTotal': _calculateTotalAmount(),
    };

    bool isFirstTimeOrder = false;
    for (var outlet in appData.globalOutlets) {
      if (outlet['name'] == widget.outletName) {
        if (outlet['isFirstOrder'] == true) {
          isFirstTimeOrder = true;
          outlet['isFirstOrder'] = false;
        }
      }
    }

    if (widget.existingOrder != null && widget.orderIndex != null) {
      appData.updateOrder(widget.orderIndex!, newOrderData);
      double oldTotal = widget.existingOrder!['grandTotal'] ?? 0.0;
      appData.updateOutletBalance(widget.outletName, _calculateTotalAmount() - oldTotal);
    } else {
      appData.addOrder(newOrderData);
      appData.updateOutletBalance(widget.outletName, _calculateTotalAmount());

      if (isFirstTimeOrder) {
        String phone = '';
        for (var o in appData.globalOutlets) {
          if (o['name'] == widget.outletName) phone = o['phone'];
        }
        if (phone.isNotEmpty) {
          String welcomeMsg = 'Welcome to Global Digital Khata! Thank you for placing your first order with us for ${widget.outletName}. Grand Total: Rs ${_calculateTotalAmount()}';
          final url = Uri.parse('https://wa.me/$phone?text=${Uri.encodeComponent(welcomeMsg)}');
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          }
        }
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order saved successfully and stock updated!')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004080),
        title: Text(widget.existingOrder != null ? 'Edit Order: ${widget.outletName}' : 'Order: ${widget.outletName}', style: const TextStyle(color: Colors.white, fontSize: 15)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.white),
            onPressed: _saveOrder,
            tooltip: 'Save Order',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: appData.globalProducts.length,
              itemBuilder: (context, index) {
                final p = appData.globalProducts[index];
                final cartonController = _controllers[index]!['carton']!;
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
                                      Text('Carton Rate: ${p['cartonRate']}', style: const TextStyle(fontSize: 11)),
                                      Text('Packet Rate: ${p['packetRate']}', style: const TextStyle(fontSize: 11)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Available Stock: C: ${p['cartonStock']} | P: ${p['packetStock']}', style: const TextStyle(fontSize: 11, color: Colors.blue)),
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
                                controller: cartonController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  labelText: 'Order Carton (Qty)',
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
                                  labelText: 'Order Packet (Qty)',
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
                const Text('Total Bill Amount:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF004080))),
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
          child: const Text('Save Order', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

// Recoveries Screen
class RecoveriesScreen extends StatefulWidget {
  const RecoveriesScreen({Key? key}) : super(key: key);

  @override
  _RecoveriesScreenState createState() => _RecoveriesScreenState();
}

class _RecoveriesScreenState extends State<RecoveriesScreen> {
  @override
  void initState() {
    super.initState();
    appData.addListener(_refreshState);
  }

  @override
  void dispose() {
    appData.removeListener(_refreshState);
    super.dispose();
  }

  void _refreshState() {
    if (mounted) setState(() {});
  }

  void _openRecoveryDialog(Map<String, dynamic> outlet) {
    final paidController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Recovery & Payment: ${outlet['name']}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Current Balance / Dues: Rs ${outlet['balance']}'),
              const SizedBox(height: 10),
              TextField(
                controller: paidController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount Paid Today'),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                double paidAmount = double.tryParse(paidController.text) ?? 0.0;
                appData.updateOutletBalance(outlet['name'], -paidAmount);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Recovery recorded successfully!')));
              },
              child: const Text('Save & Update Balance', style: TextStyle(color: Colors.white)),
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
        itemCount: appData.globalOutlets.length,
        itemBuilder: (context, index) {
          final outlet = appData.globalOutlets[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              title: Text(outlet['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Owner: ${outlet['owner']} | Phone: ${outlet['phone']}\nRemaining Balance: Rs ${outlet['balance']}'),
              isThreeLine: true,
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF004080)),
                onPressed: () => _openRecoveryDialog(outlet),
                child: const Text('Add Recovery'),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Sale Orders Screen
class SaleOrdersScreen extends StatefulWidget {
  const SaleOrdersScreen({Key? key}) : super(key: key);

  @override
  _SaleOrdersScreenState createState() => _SaleOrdersScreenState();
}

class _SaleOrdersScreenState extends State<SaleOrdersScreen> {
  @override
  void initState() {
    super.initState();
    appData.addListener(_refreshState);
  }

  @override
  void dispose() {
    appData.removeListener(_refreshState);
    super.dispose();
  }

  void _refreshState() {
    if (mounted) setState(() {});
  }

  String _getOutletPhone(String outletName) {
    for (var o in appData.globalOutlets) {
      if (o['name'] == outletName) return o['phone'] ?? '';
    }
    return '';
  }

  double _getOutletBalance(String outletName) {
    for (var o in appData.globalOutlets) {
      if (o['name'] == outletName) return o['balance'] ?? 0.0;
    }
    return 0.0;
  }

  void _launchWhatsApp(String phone, String message) async {
    final url = Uri.parse('https://wa.me/$phone?text=${Uri.encodeComponent(message)}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Could not open WhatsApp')));
    }
  }

  void _showOrderActionDialog(BuildContext context, Map<String, dynamic> order, int index) {
    String phone = _getOutletPhone(order['outletName']);
    double balance = _getOutletBalance(order['outletName']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Options for ${order['outletName']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.blue),
              title: const Text('Edit Order'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OutletOrderScreen(
                      outletName: order['outletName'],
                      existingOrder: order,
                      orderIndex: index,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment, color: Colors.green),
              title: const Text('Payment Reminder'),
              trailing: IconButton(
                icon: const Icon(Icons.chat, color: Colors.green),
                onPressed: () {
                  String msg = 'Dear shopkeeper, your total bill amount Rs: ${order['grandTotal']} (Current Dues: Rs $balance) is pending. Please clear the dues.';
                  _launchWhatsApp(phone, msg);
                },
              ),
              onTap: () {
                Navigator.pop(context);
                _showReminderDialog(context, 'Payment Reminder', 'Dear shopkeeper, your total bill amount Rs: ${order['grandTotal']} is pending. Please clear the dues.');
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt, color: Colors.orange),
              title: const Text('Invoice'),
              trailing: IconButton(
                icon: const Icon(Icons.chat, color: Colors.green),
                onPressed: () {
                  String msg = 'Invoice for ${order['outletName']}:\nDate: ${order['date']}\nGrand Total: Rs ${order['grandTotal']}';
                  _launchWhatsApp(phone, msg);
                },
              ),
              onTap: () {
                Navigator.pop(context);
                _showInvoiceDialog(context, order);
              },
            ),
            ListTile(
              leading: const Icon(Icons.refresh, color: Colors.purple),
              title: const Text('Recovery'),
              trailing: IconButton(
                icon: const Icon(Icons.chat, color: Colors.green),
                onPressed: () {
                  String msg = 'Recovery Follow-up for ${order['outletName']}. Current Balance: Rs $balance. Please pay soon.';
                  _launchWhatsApp(phone, msg);
                },
              ),
              onTap: () {
                Navigator.pop(context);
                _showReminderDialog(context, 'Recovery', 'Recovery follow-up scheduled for outlet ${order['outletName']}.');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showReminderDialog(BuildContext context, String title, String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF004080)),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Action executed successfully')));
            },
            child: const Text('OK', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showInvoiceDialog(BuildContext context, Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Invoice: ${order['outletName']}'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Date: ${order['date']}'),
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
                  const Text('Grand Total:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Rs: ${order['grandTotal'].toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appData.savedOrders.isEmpty
          ? const Center(child: Text('No orders saved for today', style: TextStyle(fontSize: 16, color: Colors.grey)))
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: appData.savedOrders.length,
              itemBuilder: (context, index) {
                final order = appData.savedOrders[index];
                double outletBalance = _getOutletBalance(order['outletName']);

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: InkWell(
                    onTap: () => _showOrderActionDialog(context, order, index),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(order['outletName'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF004080))),
                              Text(order['date'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                          const Divider(),
                          ...((order['items'] as List).map((item) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${item['title']} (${item['size']})', style: const TextStyle(fontSize: 12)),
                                    Text('Carton: ${item['carton']} | Packet: ${item['packet']} (Rs: ${item['total']})', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ))),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Grand Total:', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                'Rs: ${order['grandTotal'].toStringAsFixed(2)} (Balance: Rs $outletBalance)',
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// Products & Stock Management Screen
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    appData.addListener(_refreshState);
  }

  @override
  void dispose() {
    appData.removeListener(_refreshState);
    super.dispose();
  }

  void _refreshState() {
    if (mounted) setState(() {});
  }

  void _openProductDialog({Map<String, dynamic>? product, int? index}) {
    final titleController = TextEditingController(text: product?['title'] ?? '');
    final sizeController = TextEditingController(text: product?['size'] ?? '');
    final cartonRateController = TextEditingController(text: product?['cartonRate']?.toString() ?? '');
    final packetRateController = TextEditingController(text: product?['packetRate']?.toString() ?? '');
    final cartonStockController = TextEditingController(text: product?['cartonStock']?.toString() ?? '');
    final packetStockController = TextEditingController(text: product?['packetStock']?.toString() ?? '');
    final counterUnitPriceController = TextEditingController(text: product?['counterUnitPrice']?.toString() ?? '');
    final retailController = TextEditingController(text: product?['retail']?.toString() ?? '');

    bool isEditing = product != null;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEditing ? 'Edit Product & Stock' : 'Add New Product & Stock'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: titleController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'Product Name')),
                TextField(controller: sizeController, textCapitalization: TextCapitalization.words, decoration: const InputDecoration(labelText: 'Size (e.g. 18 Gm * 240)')),
                TextField(controller: cartonRateController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Carton Rate')),
                TextField(controller: packetRateController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Packet Rate')),
                TextField(controller: cartonStockController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Carton Stock')),
                TextField(controller: packetStockController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Packet Stock')),
                TextField(controller: counterUnitPriceController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Counter Unit Price')),
                TextField(controller: retailController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Retail Price')),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF004080)),
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  final newProductData = {
                    'title': titleController.text,
                    'size': sizeController.text,
                    'cartonRate': double.tryParse(cartonRateController.text) ?? 0.0,
                    'packetRate': double.tryParse(packetRateController.text) ?? 0.0,
                    'cartonStock': double.tryParse(cartonStockController.text) ?? 0.0,
                    'packetStock': double.tryParse(packetStockController.text) ?? 0.0,
                    'counterUnitPrice': double.tryParse(counterUnitPriceController.text) ?? 0.0,
                    'retail': double.tryParse(retailController.text) ?? 0.0,
                  };
                  if (isEditing && index != null) {
                    appData.updateProduct(index, newProductData);
                  } else {
                    appData.addProduct(newProductData);
                  }
                  Navigator.pop(context);
                }
              },
              child: Text(isEditing ? 'Update' : 'Save', style: const TextStyle(color: Colors.white)),
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
        title: const Text('Confirmation'),
        content: const Text('Are you sure you want to delete this product permanently?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('No')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              appData.deleteProduct(index);
              Navigator.pop(context);
            },
            child: const Text('Yes, Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var filteredProducts = appData.globalProducts.where((p) {
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
                labelText: 'Search product by name or size...',
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
                final originalIndex = appData.globalProducts.indexOf(p);

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
                                  mainAxisAlignment: MainArgument.spaceBetween,
                                  children: [
                                    Text('Carton Rate: ${p['cartonRate']}', style: const TextStyle(fontSize: 11)),
                                    Text('Packet Rate: ${p['packetRate']}', style: const TextStyle(fontSize: 11)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Carton Stock: ${p['cartonStock']}', style: const TextStyle(fontSize: 11, color: Colors.green)),
                                    Text('Packet Stock: ${p['packetStock']}', style: const TextStyle(fontSize: 11, color: Colors.green)),
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
        child: const Icon(Icons.add, code: Colors.white),
      ),
    );
  }
}
