import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prak5/customScrollView.dart';
import 'package:prak5/flex_exp.dart';
import 'package:prak5/jenis_listview.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const Mod5());
}

class Mod5 extends StatelessWidget {
  const Mod5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modul 5',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Color.fromARGB(255, 22, 49, 172),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFF4E9F3D)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: //JenisListView(),
          //FlexExp(),
          Customscrollview(),
    );
  }
}
