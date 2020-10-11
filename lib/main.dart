import 'package:color_bloc/color_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //area bloc
    ColorBloc bloc = ColorBloc();
    return MaterialApp(
      home: Scaffold(
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            onPressed: () {
              //menghubungkan ke keran pada colorevent stream controller (amber)
              bloc.eventsink.add(ColorEvent.to_amber);
            },
            backgroundColor: Colors.amber,
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            onPressed: () {
              //menghubungkan ke keran pada colorevent stream controller (blue)
              bloc.eventsink.add(ColorEvent.to_lightblue);
            },
            backgroundColor: Colors.lightBlue,
          )
        ]),
        appBar: AppBar(title: Text("Bloc Tanpa library")),
        body: Center(
            //streambuilder digunakan untuk membuild atau membuat widget setiap
            //kali mendapatkan update dari stream
            child: StreamBuilder(
          stream: bloc.stateStream,
          //initialdata adalah value awalnya/ warna awalnya mau dikasih apaa
          initialData: Colors.amber,
          //builder satu buah method menerima context, lalu ada snapshot
          //snapshot adalah data yang dikirimkan dari stream
          builder: (context, snapshot) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 100,
              height: 100,
              //ambil dari data snapshot yang berhasil dikirimkan dari stream
              color: snapshot.data,
            );
          },
        )),
      ),
    );
  }
}
