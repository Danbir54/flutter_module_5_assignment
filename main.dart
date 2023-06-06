import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: MyTabbedScreen(),
    );
  }
}
class MyTabbedScreen extends StatefulWidget {
  const MyTabbedScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyTabbedScreenState createState() => _MyTabbedScreenState();
}
class _MyTabbedScreenState extends State<MyTabbedScreen> with
SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabbed App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
          ListTile(
          title:const Text('Page 1'),
          onTap: () {
            _tabController.animateTo(0);
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Page 2'),
          onTap: () {
            _tabController.animateTo(1);
            Navigator.pop(context);
          },
        ),
        ListTile(
          title:const Text('Page 3'),
          onTap: () {
            _tabController.animateTo(2);
            Navigator.pop(context);
          },
        ),
        ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
        Page(color: Color.fromARGB(255, 92, 84, 83), number: 1),
        Page(color: Color.fromARGB(255, 175, 76, 163), number: 2),
        Page(color: Color.fromARGB(255, 43, 40, 11), number: 3),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: const [
        Tab(icon: Icon(Icons.looks_one)),
        Tab(icon: Icon(Icons.looks_two)),
        Tab(icon: Icon(Icons.looks_3)),
        ],
      ),
    );
  }
}
class Page extends StatelessWidget {
  final Color color;
  final int number;
  const Page({super.key, required this.color, required this.number});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      backgroundColor: color,
      child: Text(
        '$number',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    body: Center(
      child: Text(
        'Page $number',
        style: const TextStyle(fontSize: 24),
      ),
    ),
    );
  }
}