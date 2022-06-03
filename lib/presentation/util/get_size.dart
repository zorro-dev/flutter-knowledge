// main.dart
import 'package:flutter/material.dart';


class GetSize extends StatelessWidget {
  const GetSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Key and Size of the Card widget
  final _cardWidgetKey = GlobalKey();
  Size? _cardWidgetSize;

  // Key and Size of the Text widget
  final _textWidgetKey = GlobalKey();
  Size? _textWidgetSize;

  // This function is triggered when the floating button is pressed
  // You can trigger it by using other events
  void _getSize() {
    setState(() {
      _textWidgetSize = _textWidgetKey.currentContext!.size;
      _cardWidgetSize = _cardWidgetKey.currentContext!.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: ListView(
        children: [
          Card(
            key: _cardWidgetKey,
            margin: const EdgeInsets.all(30),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Center(
                child: Text(
                  'Text Widget',
                  key: _textWidgetKey,
                  style: const TextStyle(
                      fontSize: 35, backgroundColor: Colors.amber),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              _cardWidgetSize != null
                  ? 'Card Widget Size: ${_cardWidgetSize!.width.toString()} x ${_cardWidgetSize!.height.toString()}'
                  : '',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Center(
            child: Text(
              _textWidgetSize != null
                  ? 'Text Widget Size: ${_textWidgetSize!.width.toString()} x ${_textWidgetSize!.height.toString()}'
                  : '',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _getSize, child: const Icon(Icons.calculate)),
    );
  }
}