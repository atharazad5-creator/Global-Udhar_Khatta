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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A1A4E)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// 1. ہوم پیج اور پارٹی کا بٹن
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ڈیش بورڈ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 12),
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

// 2. نیو کسٹمر بائیو ڈیٹا فارم
class NewCustomerScreen extends StatefulWidget {
  const NewCustomerScreen({super.key});

  @override
  State<NewCustomerScreen> createState() => _NewCustomerScreenState();
}

class _NewCustomerScreenState extends State<NewCustomerScreen> {
  final TextEditingController shopController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A4E),
        title: const Text('New Customer', style: TextStyle(color: Colors.white)),
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
              decoration: InputDecoration(
                labelText: 'Shop Name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Contact Person',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Mobile #',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Whatsapp #',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Area / Street',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              ),
            ),
            const SizedBox(height: 16),
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
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A1A4E),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SaleOrderScreen(customerName: shopController.text.isEmpty ? 'Khawaja Adnan Kiryana (1)' : shopController.text),
                        ),
                      );
                    },
                    icon: const Icon(Icons.check, color: Colors.white),
                    label: const Text('SAVE CUSTOMER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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

// 3. سیل آرڈر پیج (تھری ڈاٹس مینو میں Edit, Recovery اور WhatsApp Reminder کے ساتھ)
class SaleOrderScreen extends StatefulWidget {
  final String customerName;
  const SaleOrderScreen({super.key, required this.customerName});

  @override
  State<SaleOrderScreen> createState() => _SaleOrderScreenState();
}

class _SaleOrderScreenState extends State<SaleOrderScreen> {
  List<Map<String, dynamic>> selectedItems = [];
  double recoveryAmount = 0.0;

  // آئٹم سلیکشن ڈائیلاگ
  void _openItemSelection() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Select Item', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text('Vista Detergent Powder 85 Gm*66'),
                      subtitle: const Text('Price: Rs. 8674.29'),
                      trailing: const Icon(Icons.add_circle, color: Colors.deepOrange),
                      onTap: () {
                        setState(() {
                          selectedItems.add({
                            'name': '274452 Vista Detergent Powder 85 Gm*66',
                            'price': 8674.29,
                            'ctn': 3,
                            'pcs': 0,
                            'unitPrice': 43.81
                          });
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ڈسکاؤنٹ ڈائیلاگ
  void _openDiscountDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Discount'),
          content: const TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter Discount Amount'),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Discount Applied!')));
            }, child: const Text('Apply')),
          ],
        );
      },
    );
  }

  // 1. ایڈٹ کرنے کا فنکشن (موجودہ آرڈر یا کسٹمر کی معلومات میں ترمیم)
  void _editOrderDetails() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Order / Customer Info'),
          content: const TextField(
            decoration: InputDecoration(labelText: 'Update Notes or Details'),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Details Updated Successfully!')));
            }, child: const Text('Save Changes')),
          ],
        );
      },
    );
  }

  // 2. ریکوری (Recovery) درج کرنے کا فنکشن
  void _addRecovery() {
    TextEditingController recoveryController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Recovery Amount'),
          content: TextField(
            controller: recoveryController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Recovery Amount (Rs)'),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(onPressed: () {
              setState(() {
                recoveryAmount = double.tryParse(recoveryController.text) ?? 0.0;
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Recovery of Rs. $recoveryAmount added successfully!')),
              );
            }, child: const Text('Add Recovery')),
          ],
        );
      },
    );
  }

  // 3. واٹس ایپ میسج ریمائنڈر (WhatsApp Reminder) بھیجنے کا فنکشن
  void _sendWhatsAppReminder(double totalBill) {
    double netBalance = totalBill - recoveryAmount;
    String message = "Hello *${widget.customerName}*,\nYour total bill is Rs. $totalBill. Recovery received: Rs. $recoveryAmount.\nRemaining Balance: Rs. $netBalance.\nPlease clear your dues. Thank you!";
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('WhatsApp Reminder Sent'),
          content: Text('Generated Message:\n\n$message'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('WhatsApp Reminder Triggered!')));
              },
              child: const Text('OK / Send via WhatsApp', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalBill = selectedItems.fold(0, (sum, item) => sum + (item['price'] as double));
    double netBalance = totalBill - recoveryAmount;

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
          IconButton(icon: const Icon(Icons.post_add, color: Colors.white), onPressed: _openDiscountDialog),
          IconButton(icon: const Icon(Icons.calendar_today, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.print, color: Colors.white), onPressed: () {}),
          
          // ٹاپ رائٹ تھری ڈاٹ مینو (Edit, Recovery, WhatsApp Reminder)
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'edit') {
                _editOrderDetails();
              } else if (value == 'recovery') {
                _addRecovery();
              } else if (value == 'whatsapp') {
                _sendWhatsAppReminder(totalBill);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'edit',
                child: Row(
                  children: [Icon(Icons.edit, color: Colors.blue, size: 20), SizedBox(width: 8), Text('Edit')],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'recovery',
                child: Row(
                  children: [Icon(Icons.account_balance_wallet, color: Colors.orange, size: 20), SizedBox(width: 8), Text('Recovery')],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'whatsapp',
                child: Row(
                  children: [Icon(Icons.message, color: Colors.green, size: 20), SizedBox(width: 8), Text('WhatsApp Reminder')],
                ),
              ),
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
                    const Text('Customer  ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                    Expanded(child: Text(widget.customerName, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A1A4E))))
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Inv. Date  21/09/2026', style: TextStyle(color: Colors.black87)),
                    Row(
                      children: const [
                        Checkbox(value: false, onChanged: null),
                        Text('Return Order'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: selectedItems.isEmpty
                ? Container(
                    color: Colors.orange,
                    child: const Center(
                      child: Text(
                        'آئٹم شامل کرنے کے لیے نیچے "ITEM" پر کلک کریں',
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
                                Text('CTN: ${item['ctn']}, PCS: ${item['pcs']}   Unit Price: ${item['unitPrice']}'),
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
                      const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Prev. Bal.'), Text('0.0')]),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('New Bal.', style: TextStyle(color: Colors.red)), Text('$netBalance', style: const TextStyle(color: Colors.red))]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: _openItemSelection,
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
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sale Order Saved Successfully!')));
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
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Payment Window Open')));
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
