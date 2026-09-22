import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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
      home: const UdharHomePage(),
    );
  }
}

class UdharHomePage extends StatefulWidget {
  const UdharHomePage({super.key});

  @override
  State<UdharHomePage> createState() => _UdharHomePageState();
}

class _UdharHomePageState extends State<UdharHomePage> {
  List<Map<String, dynamic>> customers = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  // ڈیٹا کو موبائل میں محفوظ (Save) کرنا
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stringList = customers.map((c) => "${c['name']}:${c['amount']}").toList();
    await prefs.setStringList('customers_data', stringList);
  }

  // محفوظ شدہ ڈیٹا کو واپس لوڈ کرنا
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? stringList = prefs.getStringList('customers_data');
    if (stringList != null) {
      setState(() {
        customers = stringList.map((item) {
          final parts = item.split(':');
          return {'name': parts[0], 'amount': double.tryParse(parts[1]) ?? 0.0};
        }).toList();
      });
    }
  }

  void addCustomer() {
    if (nameController.text.isNotEmpty && amountController.text.isNotEmpty) {
      setState(() {
        customers.add({
          'name': nameController.text,
          'amount': double.tryParse(amountController.text) ?? 0.0,
        });
      });
      nameController.clear();
      amountController.clear();
      saveData();
    }
  }

  void updateAmount(int index, double delta) {
    setState(() {
      customers[index]['amount'] += delta;
    });
    saveData();
  }

  Future<void> sendWhatsAppReminder(String name, double amount) async {
    final url = Uri.parse("https://wa.me/?text=Hello $name, your remaining balance is Rs $amount. Please clear it soon.");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalUdhar = customers.fold(0, (sum, item) => sum + (item['amount'] as double));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Udhar Khatta'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blue.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Udhar:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Rs $totalUdhar', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(customers[index]['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Amount: Rs ${customers[index]['amount']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.red),
                          onPressed: () => updateAmount(index, -100),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle, color: Colors.green),
                          onPressed: () => updateAmount(index, 100),
                        ),
                        IconButton(
                          icon: const Icon(Icons.share, color: Colors.teal),
                          onPressed: () => sendWhatsAppReminder(customers[index]['name'], customers[index]['amount']),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Customer Name', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Amount (Rs)', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                  onPressed: addCustomer,
                  child: const Text('Add Customer', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
