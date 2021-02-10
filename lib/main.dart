import 'dart:io';

import 'package:coronaupdateflutter/drawerPages/map.dart';
import 'package:coronaupdateflutter/pages/select_country.dart';
import 'package:coronaupdateflutter/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'pages/home.dart';
import 'pages/loading.dart';

void main()async => runApp(MaterialApp(
  initialRoute: await _read()==null?'/start_page':'/',
  debugShowCheckedModeBanner: false,
  routes: {
    '/': (context)=>SelectCountry(),
    '/start_page': (context)=>StartPage(),
    '/loading': (context)=>Loading(),
    '/home': (context)=>Home(),
    '/map' : (context)=>Flutter_Map(),
  }
));

  Future<String> _write(String text) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/my_file.txt');
    await file.writeAsString(text, mode: FileMode.append);
  }
  Future<String> _read() async {
    String text;
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final File file = File('${directory.path}/my_file.txt');
      text = await file.readAsString();
      print(text);
    } catch (e) {
      print("Couldn't read file");
    }
    return text;
  }