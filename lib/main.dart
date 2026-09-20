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
  int _currentIndex = 0;

  // محفوظ شدہ آؤٹ لیٹس کی فہرست
  final List<Map<String, dynamic>> _outlets = [
    {'id': 1, 'name': 'المدینہ جنرل سٹور، کراچی'},
    {'id': 2, 'name': 'البحرین سپر مارکیٹ'},
    {'id': 3, 'name': 'الفضل ٹریڈرز اینڈ جنرل سٹور'},
    {'id': 4, 'name': 'الرحیم کریانہ سٹور'},
    {'id': 5, 'name': 'نبی بخش اینڈ سنز'},
  ];

  List<Map<String, dynamic>> _filteredOutlets = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredOutlets = _outlets;
  }

  void _filterOutlets(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredOutlets = _outlets;
      } else {
        _filteredOutlets = _outlets
            .where((outlet) =>
                outlet['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
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
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text('گلوبل ڈیجیٹل کھاتہ', style: TextStyle(fontSize: 18, color: Colors.white)),
          ],
        ),
      ),
      body: _currentIndex == 0 ? _buildOutletsTab() : const LedgerTab(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFFFF9900),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'مائی آؤٹ لیٹس',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'ڈیجیٹل کھاتہ',
          ),
        ],
      ),
    );
  }

  // مائی آؤٹ لیٹس اور سرچ بار کا ٹیب
  Widget _buildOutletsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'مائی آؤٹ لیٹس (دکانیں)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF004080)),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _searchController,
            onChanged: _filterOutlets,
            decoration: InputDecoration(
              hintText: '🔍 دکان کا نام تلاش کریں...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: _filteredOutlets.isEmpty
                ? const Center(child: Text('کوئی دکان نہیں ملی'))
                : ListView.builder(
                    itemCount: _filteredOutlets.length,
                    itemBuilder: (context, index) {
                      final outlet = _filteredOutlets[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          title: Text(
                            outlet['name'],
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          trailing: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderPunchScreen(outletName: outlet['name']),
                                ),
                              );
                            },
                            child: const Text('آرڈر پنچ کریں'),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// آرڈر پنچ کرنے کی سکرین
class OrderPunchScreen extends StatefulWidget {
  final String outletName;
  const OrderPunchScreen({Key? key, required this.outletName}) : super(key: key);

  @override
  _OrderPunchScreenState createState() => _OrderPunchScreenState();
}

class _OrderPunchScreenState extends State<OrderPunchScreen> {
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  void _submitOrder() {
    if (_itemController.text.isEmpty || _qtyController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('براہ کرم آئٹم اور مقدار درج کریں!')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('"${widget.outletName}" کے لیے آرڈر کامیابی سے پنچ ہو گیا!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF004080),
        title: const Text('آرڈر پنچ کریں', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'دکان: ${widget.outletName}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF004080)),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _itemController,
              decoration: const InputDecoration(
                labelText: 'آئٹم کا نام / پروڈکٹ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _qtyController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'مقدار (Quantity)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'کل رقم (Rs)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF004080),
                  foregroundColor: Colors.white,
                ),
                onPressed: _submitOrder,
                child: const Text('آرڈر سبمٹ کریں', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ڈیجیٹل کھاتہ ٹیب
class LedgerTab extends StatelessWidget {
  const LedgerTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'گلوبل ڈیجیٹل کھاتہ (لیجر)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF004080)),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue[100]!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('کل بقایاجات:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Rs. 12,500', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('نیا لین دین شامل کریں:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              labelText: 'گاہک / آؤٹ لیٹ کا نام',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'رقم (Rs)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF9900)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('کھاتہ کامیابی سے اپ ڈیٹ ہو گیا!')),
              );
            },
            child: const Text('محفوظ کریں', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
