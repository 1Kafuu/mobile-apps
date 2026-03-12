// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Dashboard',
      home: const DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Dashboard'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. CONTAINER
            const Text('Container', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.blue,
            ),
            
            const SizedBox(height: 20),
            
            // 2. ROW & COLUMN
            const Text('Row & Column', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(width: 50, height: 50, color: Colors.red),
                      Container(width: 50, height: 50, color: Colors.green),
                      Container(width: 50, height: 50, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(width: 50, height: 50, color: Colors.orange),
                      Container(width: 50, height: 50, color: Colors.purple),
                      Container(width: 50, height: 50, color: Colors.teal),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // 3. STACK
            const Text('Stack', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              height: 150,
              color: Colors.grey[200],
              child: Stack(
                children: [
                  Container(width: double.infinity, height: 150, color: Colors.blue[100]),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(width: 50, height: 50, color: Colors.red),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(width: 50, height: 50, color: Colors.green),
                  ),
                  Center(
                    child: Container(width: 50, height: 50, color: Colors.orange),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // 4. GRIDVIEW
            const Text('GridView', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              height: 150,
              color: Colors.grey[200],
              child: GridView.count(
                crossAxisCount: 5,
                children: List.generate(10, (index) {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    color: Colors.primaries[index % Colors.primaries.length],
                  );
                }),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // 5. LISTVIEW
            const Text('ListView', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              height: 200,
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    color: Colors.blue[index * 100],
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