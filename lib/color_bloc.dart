import 'dart:async';

import 'package:flutter/material.dart';

//membuat color event nya
enum ColorEvent { to_amber, to_lightblue }

class ColorBloc {
  //awal nya warna amber
  Color _color = Colors.amber;
  //streamcontroller color event
  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventsink => _eventController.sink;

//streamcontroller color state
  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _statesink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

//method colorevent
  void _mapEventToState(ColorEvent colorEvent) {
    //jika color event to amber
    if (colorEvent == ColorEvent.to_amber) {
      _color = Colors.amber;
    } else {
      _color = Colors.lightBlue;
    }
    //input color ke state controller sink
    _statesink.add(_color);
  }

  //contructor colorBloc
  ColorBloc() {
    //menghubungkan stream pada _eventController ke _mapeventtostate
    _eventController.stream.listen((_mapEventToState));
  }
//void dispose untuk membersihkan atau menghentikan stream agar tidak memakan memori
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
