import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Column(
                  children: [
                    _buildHeader(context),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: Row(
                        children: [
                          FilterChip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            selected: true,
                            onSelected: (_) {},
                            label: Text('All'),
                          ),
                          ChoiceChip(selected: false, label: Text('Manga')),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 175, 0, 0),
                  child: Center(child: _buildSearchBar(context)),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      child: _buildImage(context, "assets/images/bleach_tybw.jpg"),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          prefixIcon: const Icon(Icons.search, color: Colors.black, size: 30),
          suffixIcon: const Icon(Icons.tune, color: Colors.black, size: 30),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color.fromARGB(155, 236, 231, 231),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context, String imagePath) {
    return Image.asset(imagePath, fit: BoxFit.cover);
  }
}
