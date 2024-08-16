import 'package:bytelogik_task/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPage extends StatefulWidget {
  final String username;

  CounterPage({required this.username});

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounterValue();
  }

  Future<void> _loadCounterValue() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('${widget.username}_counter') ?? 0;
    });
  }

  Future<void> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('${widget.username}_counter', _counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
          title: const Text('Bytelogik',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${widget.username}!', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text('Increment Value: $_counter', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(300, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: const Text('Increment',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:(){
                setState(() {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(300, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: const Text('Logout',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
            )
          ],
        ),
      ),
    );
  }
}
