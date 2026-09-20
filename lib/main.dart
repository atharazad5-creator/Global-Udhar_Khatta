import 'package:flutter/material.dart';

void main() {
  runApp(const GlobalUdharApp());
}

class GlobalUdharApp extends StatelessWidget {
  const GlobalUdharApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Udhar Khatta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// 1. ہوم پیج (سلائیڈ اور نیو کسٹمر/پارٹی کا بٹن)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'Global Udhar Khatta',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // اوپر والی سلائیڈ / ایڈورٹائزمنٹ بینر
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.deepOrange, Colors.orangeAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Global Products & Services',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Explore our exclusive items & coming soon features!',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'ڈیش بورڈ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 12),
            
            // پارٹی / نیو کسٹمر بٹن
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewCustomerScreen()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.deepOrange, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(Icons.people, size: 36, color: Colors.deepOrange),
                    SizedBox(width: 16),
                    Text(
                      'پارٹی (New Customer)',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, color: Colors.deepOrange, size: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. نیو کسٹمر بائیو ڈیٹا فارم (شاپ نام، کانٹیکٹ، واٹس ایپ، اسٹریٹ، ایریا، سٹی)
class NewCustomerScreen extends StatefulWidget {
  const NewCustomerScreen({super.key});

  @override
  State<NewCustomerScreen> createState() => _NewCustomerScreenState();
}

class _NewCustomerScreenState extends State<NewCustomerScreen> {
  final TextEditingController shopController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A4E),
        title: const Text('New Customer Form', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: shopController,
              decoration: InputDecoration(labelText: 'Shop Name', border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: contactController,
              decoration: InputDecoration(labelText: 'Contact Person', border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Mobile #', border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: whatsappController,
                    decoration: InputDecoration(labelText: 'Whatsapp #', border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              controller: streetController,
              decoration: InputDecoration(labelText: 'Street / Gali', border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: areaController,
              decoration: InputDecoration(labelText: 'Area', border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'City Name', border: OutlineInputBorder(borderRadius: BorderRadius.circular(4))),
            ),
            const SizedBox(height: 20),
            
            // نیچے تین بٹن: Cancel, Edit, Save Customer
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white),
                    label: const Text('CANCEL', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Edit Mode Enabled')));
                    },
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text('EDIT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A1A4E),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    onPressed: () {
                      String customer = shopController.text.isEmpty ? 'Khawaja Adnan Kiryana' : shopController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SaleOrderScreen(customerName: customer),
                        ),
                      );
                    },
                    icon: const Icon(Icons.check, color: Colors.white),
                    label: const Text('SAVE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 3. سیل آرڈر پیج (پروڈکٹ سرچ، بلنگ، اور تھری ڈاٹ مینو)
class SaleOrderScreen extends StatefulWidget {
  final String customerName;
  const SaleOrderScreen({super.key, required this.customerName});

  @override
  State<SaleOrderScreen> createState() => _SaleOrderScreenState();
}

class _SaleOrderScreenState extends State<SaleOrderScreen> {
  List<Map<String, dynamic>> selectedItems = [];
  double recoveryAmount = 0.0;
  String additionalNote = '';

  // فرضی پروڈکٹ ڈیٹا بیس (سرچ کے لیے)
  final List<Map<String, dynamic>> allProducts = [
    {'name': 'Pampers Small Size Box', 'company': 'Pampers', 'size': 'Small', 'ctn': 5, 'pcs': 24, 'price': 3500.0},
    {'name': 'Vista Detergent Powder 85 Gm', 'company': 'Vista', 'size': '85 Gm', 'ctn': 3, 'pcs': 66, 'price': 8674.29},
    {'name': 'Super Tea 500g Box', 'company': 'Super', 'size': '500g', 'ctn': 10, 'pcs': 12, 'price': 1500.0},
  ];

  // پلس (+) آئیکن دبانے پر پروڈکٹ سرچ اور سلیکشن ونڈو کھلنا
  void _openProductSearch() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        String searchQuery = '';
        return StatefulBuilder(
          builder: (context, setModalState) {
            final filteredProducts = allProducts.where((p) => p['name'].toLowerCase().contains(searchQuery.toLowerCase())).toList();

            return Container(
              padding: const EdgeInsets.all(16),
              height: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Search & Select Product', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A1A4E))),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Search Product (e.g., Pampers)',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setModalState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final prod = filteredProducts[index];
                        return Card(
                          child: ListTile(
                            title: Text(prod['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text('Company: ${prod['company']} | Size: ${prod['size']}\nStock - CTN: ${prod['ctn']}, PCS: ${prod['pcs']}'),
                            trailing: Text('Rs. ${prod['price']}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                            onTap: () {
                              setState(() {
                                selectedItems.add(prod);
                              });
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // تھری ڈاٹ مینو فیچرز: 1. Edit
  void _editOrder() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Order'),
          content: const TextField(decoration: InputDecoration(labelText: 'Update Order Details')),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order Updated!')));
            }, child: const Text('Save')),
          ],
        );
      },
    );
  }

  // تھری ڈاٹ مینو فیچرز: 2. Recovery
  void _addRecovery() {
    TextController: TextEditingController recController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Recovery Amount'),
          content: TextField(controller: recController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Amount (Rs)')),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(onPressed: () {
              setState(() {
                recoveryAmount = double.tryParse(recController.text) ?? 0.0;
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Recovery Added: Rs. $recoveryAmount')));
            }, child: const Text('Add')),
          ],
        );
      },
    );
  }

  // تھری ڈاٹ مینو فیچرز: 3. WhatsApp Reminder
  void _whatsappReminder(double totalBill) {
    double netBal = totalBill - recoveryAmount;
    String msg = "Hello *${widget.customerName}*,\nYour Bill Total: Rs. $totalBill\nRecovery: Rs. $recoveryAmount\nNew Balance: Rs. $netBal\nPlease clear dues. Thank you!";
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('WhatsApp Reminder'),
          content: Text(msg),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('WhatsApp Reminder Triggered!')));
              },
              child: const Text('Send WhatsApp', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  // تھری ڈاٹ مینو فیچرز: 4. Additional Note
  void _addNote() {
    TextEditingController noteController = TextEditingController(text: additionalNote);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Additional Note'),
          content: TextField(controller: noteController, decoration: const InputDecoration(labelText: 'Enter Note')),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(onPressed: () {
              setState(() {
                additionalNote = noteController.text;
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Note Saved!')));
            }, child: const Text('Save Note')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalBill = selectedItems.fold(0, (sum, item) => sum + (item['price'] as double));
    double newBalance = totalBill - recoveryAmount;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A4E),
        title: const Text('Sale Order', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.qr_code_scanner, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.post_add, color: Colors.white), onPressed: _openProductSearch),
          IconButton(icon: const Icon(Icons.calendar_today, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.print, color: Colors.white), onPressed: () {}),
          
          // ٹاپ رائٹ تھری ڈاٹ مینو (Edit, Recovery, WhatsApp Reminder, Note)
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'edit') _editOrder();
              if (value == 'recovery') _addRecovery();
              if (value == 'whatsapp') _whatsappReminder(totalBill);
              if (value == 'note') _addNote();
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'edit', child: Row(children: [Icon(Icons.edit, color: Colors.blue, size: 20), SizedBox(width: 8), Text('Edit')])),
              const PopupMenuItem(value: 'recovery', child: Row(children: [Icon(Icons.account_balance_wallet, color: Colors.orange, size: 20), SizedBox(width: 8), Text('Recovery')])),
              const PopupMenuItem(value: 'whatsapp', child: Row(children: [Icon(Icons.message, color: Colors.green, size: 20), SizedBox(width: 8), Text('WhatsApp Reminder')])),
              const PopupMenuItem(value: 'note', child: Row(children: [Icon(Icons.note_add, color: Colors.purple, size: 20), SizedBox(width: 8), Text('Additional Note')])),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.grey[200],
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Customer: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                    Expanded(child: Text(widget.customerName, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A1A4E))))
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Inv. Date: 21/09/2026', style: TextStyle(color: Colors.black87)),
                    Row(
                      children: const [
                        Checkbox(value: false, onChanged: null),
                        Text('Return Order'),
                      ],
                    ),
                  ],
                ),
                if (additionalNote.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Align(alignment: Alignment.centerLeft, child: Text('Note: $additionalNote', style: const TextStyle(color: Colors.purple, fontStyle: FontStyle.italic))),
                ]
              ],
            ),
          ),
          
          // پروڈکٹ لسٹ یا پلین اورنج بیک گراؤنڈ
          Expanded(
            child: selectedItems.isEmpty
                ? Container(
                    color: Colors.orange,
                    child: const Center(
                      child: Text(
                        'آئٹم شامل کرنے کے لیے نیچے "ITEM" بٹن دبائیں',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: selectedItems.length,
                    itemBuilder: (context, index) {
                      final item = selectedItems[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.orange[50],
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold))),
                                Text('Rs. ${item['price']}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A1A4E))),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('CTN: ${item['ctn']}, PCS: ${item['pcs']} | Size: ${item['size']}'),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  color: Colors.green,
                                  child: const Text('SYNCED', style: TextStyle(color: Colors.white, fontSize: 10)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),

          // بل سمری (Bill Summary)
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Items'), Text('${selectedItems.length}')]),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Bill Total'), Text('$totalBill')]),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Recovery'), Text('$recoveryAmount')]),
                    ],
                  ),
                ),
                Container(width: 1, height: 50, color: Colors.grey, margin: const EdgeInsets.symmetric(horizontal: 10)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Prev. Bal.'), Text('0.0')]),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('New Bal.', style: TextStyle(color: Colors.red)), Text('$newBalance', style: const TextStyle(color: Colors.red))]),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // سب سے نیچے تین بٹن (ITEM, SAVE, PAYMENT)
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: _openProductSearch,
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text('ITEM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1A1A4E),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order Saved Successfully!')));
                  },
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text('SAVE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Payment Window Opened')));
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text('PAYMENT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
