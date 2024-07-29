import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tipstate extends StateNotifier<Map>{
  Tipstate():super({"gst":0.00,"tip":0.00,"instructions":""});

  void settip(int num){
    state={...state,"tip":num.toDouble()};
  }

 void setgst(double num){
  state={...state,"gst":num};
 }

 void addinstruction(String inst){
  state={...state,"instructions":inst};
 }


}

final TipProvider=StateNotifierProvider<Tipstate,Map>((ref) => Tipstate());