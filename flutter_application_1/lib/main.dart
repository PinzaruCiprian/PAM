import 'package:flutter/material.dart';

void main() {
  runApp(CalorieApp());
}

class CalorieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Calorii',
      theme: ThemeData(primarySwatch: Colors.green),
      home: CalorieHomePage(),
    );
  }
}

class CalorieHomePage extends StatefulWidget {
  @override
  _CalorieHomePageState createState() => _CalorieHomePageState();
}

class _CalorieHomePageState extends State<CalorieHomePage> {
  final TextEditingController _alimentController = TextEditingController();
  final TextEditingController _caloriiController = TextEditingController();

  final List<Map<String, dynamic>> _alimente = [];
  int _totalCalorii = 0;

  void _adaugaAliment() {
    final String aliment = _alimentController.text;
    final String caloriiText = _caloriiController.text;

    if (aliment.isEmpty || caloriiText.isEmpty) return;

    final int? calorii = int.tryParse(caloriiText);
    if (calorii == null) return;

    setState(() {
      _alimente.add({'aliment': aliment, 'calorii': calorii});
      _totalCalorii += calorii;
    });

    _alimentController.clear();
    _caloriiController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator Calorii'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _alimentController,
              decoration: InputDecoration(
                labelText: 'Aliment',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _caloriiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Calorii per aliment',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _adaugaAliment,
              child: Text('Adaugă aliment'),
            ),
            SizedBox(height: 20),
            Text(
              'Total calorii zilnice: $_totalCalorii',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _alimente.length,
                itemBuilder: (context, index) {
                  final item = _alimente[index];
                  return ListTile(
                    title: Text(item['aliment']),
                    trailing: Text('${item['calorii']} kcal'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
