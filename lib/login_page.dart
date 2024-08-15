import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'counter_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _login() async {
    final username = _usernameController.text.trim();
    if (username.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CounterPage(username: username)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter a username.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics:ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                SizedBox(
                  width: double.infinity,
                    height: 290,
                    child: Image.asset('images/login.png')),
                const Text('Bytelogik' ,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold
                ,fontSize: 30),),
                const SizedBox(height: 20,),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      suffixIcon:const Icon( Icons.person,color: Colors.grey,),
                      hintText: '   Username',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                          const BorderSide(color:Colors.blue, width: 2.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(300, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
