import 'package:flutter/material.dart';

import '../layers/presentation/products/view/products_screeen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      showSemanticsDebugger: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: ProductsScreen(),
    );
  }
}
