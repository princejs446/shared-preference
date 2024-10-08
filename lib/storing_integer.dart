import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedprefCounter extends StatefulWidget{
  @override  
  State<SharedprefCounter> createState()=>_SharedprefCounterState();
}
class _SharedprefCounterState extends State<SharedprefCounter>{
  int _counter=0;
  void initState(){
    super.initState();
    loadCounter();
  }
  loadCounter()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    setState(() {
      _counter=prefs.getInt('counter')??0;
    }
    );
  }
  incrementCounter()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    setState(() {
      _counter++;
    },
    );
    prefs.setInt('counter',_counter);
  }
  @override  
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(title: Text("Counter using Sharedpreferneces"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("counter value:$_counter"),
            SizedBox(height: 15),
            ElevatedButton(onPressed: incrementCounter, child: Text("Increment Counter")),
          ],
        ),
      ),
    );
  }
}