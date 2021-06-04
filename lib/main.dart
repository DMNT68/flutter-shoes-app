import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';

import 'package:shoes_app/src/model/zapato_model.dart';
import 'package:shoes_app/src/pages/zapato_page.dart';
 
void main(){ 
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ZapatoModel()),
      ],
      child: MyApp()
    )
  );
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarNavigationBar();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes App',
      home: ZapatoPage()
    );
  }
}