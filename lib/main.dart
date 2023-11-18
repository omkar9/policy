import 'package:api_app/menu1.dart';
import 'package:api_app/pages/circle.dart';
import 'package:api_app/pages/crushing.dart';
import 'package:api_app/pages/online.dart';
import 'package:api_app/pages/varity_dist.dart';
import 'package:api_app/screens/Report.dart';
import 'package:api_app/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'User.dart';

/*main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    //home: Report(),
  ));
}*/
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
      runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titled Bar',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
/*  final List<TitledNavigationBarItem> items = [
    TitledNavigationBarItem(title: Text('Online'), icon: Icon(Icons.description)),
    TitledNavigationBarItem(title: Text('Variety & Distance'), icon: Icon(Icons.description)),
    TitledNavigationBarItem(title: Text('Circle'), icon: Icon(Icons.description)),
    TitledNavigationBarItem(title: Text('Crushing'), icon: Icon(Icons.description)),
  ];*/
  int _currentIndex = 0;
  List<Widget> itemList = <Widget> [
    online(),
    varity_dist(),
    circle(),
    crushing(),
  ];
  void _onItemTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  bool navBarMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SPSCL-CC',style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFE2213E),

      ),
      body: Center(
        child:  itemList.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(

        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Online',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Varity & Distance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Circle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Crushing',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTap,
      ),
    );
  }

}