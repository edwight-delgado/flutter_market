import 'package:flutter/material.dart';
import 'package:map_mark/map_marker.dart';
import 'package:map_mark/tienda_name.dart';
import 'package:map_mark/tienda_store.dart';
import './screen/animate_market_map.dart';
import 'category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(),
        "/map": (context) => const AnimatedMarkerMap(),
        "/category": (context) => const TiendaCategories(),
        "/tiendas": (context) => const TiendaStoreName(),
      },
      //home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int maker = mapMarkers.length;

  @override
  Widget build(BuildContext context) {
    //final String m = maker.title;

    // print('make ---> $m');

    return const TiendaStoreHome(); //AnimatedMarkerMap(),
  }
}
