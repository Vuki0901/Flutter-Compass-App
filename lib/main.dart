import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? heading = 0.0;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(123, 31, 162, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(250, 167, 33, 1),
        title: const Text('MMOS - 2. seminarski rad', style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${heading?.ceil()}",
            style: const TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50.0
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Stack(
              children: [
                Image.asset('assets/cadrant.png'),
                Transform.rotate(
                  angle: ((heading ?? 0) *  (3.1412 / 180) * -1),
                  child: Image.asset('assets/compass.png')
                )
              ]
            )
          )
        ],
      ),
    );
  }
}
