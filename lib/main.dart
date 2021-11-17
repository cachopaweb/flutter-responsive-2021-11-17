import 'package:flutter/material.dart';
import 'package:flutter_responsive/responsive_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  _generateCards() {
    return List<Widget>.generate(
      100,
      (int index) => Card(
        color: Colors.primaries[index % Colors.primaries.length],
        child: SizedBox(
          height: 200,
          width: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 60,
                ),
                Text('Card $index'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Responsive'),
        centerTitle: true,
      ),
      body: ResponsiveWidget(
        mobile: ListView(
          children: _generateCards(),
        ),
        tablet: GridView.count(
          crossAxisCount: 4,
          children: _generateCards(),
        ),
        desktop: GridView.count(
          crossAxisCount: 6,
          children: _generateCards(),
        ),
      ),
    );
  }
}
