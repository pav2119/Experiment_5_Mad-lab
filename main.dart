import 'package:flutter/material.dart';
import 'mail.dart';
import 'primary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  int _count = 0;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', 
    style: TextStyle(
      fontSize: 35, 
      fontWeight: FontWeight.bold)
      ),
      Text('Search Page',
      style: TextStyle(
      fontSize: 35, 
      fontWeight: FontWeight.bold)
      ),
      Text('Profile Page',
      style: TextStyle(
      fontSize: 35, 
      fontWeight: FontWeight.bold)
      ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Navigation Drawer'),
        backgroundColor: Colors.blueAccent,
      ),
        body: Center(
    child: _widgetOptions.elementAt(_selectedIndex),
  ),

  bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home'),
        backgroundColor: Colors.indigo) ,
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        title: Text('Search'),
        backgroundColor: Colors.deepPurple),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Profile'),
        backgroundColor: Colors.blueAccent),
    ],
    type: BottomNavigationBarType.shifting,
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.black,
    iconSize: 40,
    onTap: _onItemTapped,
    elevation: 5),

    floatingActionButton: FloatingActionButton(
      onPressed: () => setState(() {
        _count++;
      }),
      tooltip: 'Increment Counter',
      child: const Icon(Icons.add),
    ),

    floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    
     drawer: Drawer(
        elevation: 20.0,
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Sai Pavani Lanka'), 
              accountEmail: Text('saipavani2119@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('SIES'),
              ),
              ),
              ListTile(
                title: const Text("Inbox"),
                leading: const Icon(Icons.mail),
                onTap:() {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mailpage()),
                  );
                },
              ),
              const Divider(
                height: 0.1,
              ),
              ListTile(
                title: const Text("Primary"),
                leading: const Icon(Icons.inbox),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Primarypage()),
                  );
                },
              ),
              ListTile(
                title: const Text("Social"),
                leading: new Icon(Icons.people),
              ),
              ListTile(
                title: const Text("Promotions"),
                leading: new Icon(Icons.local_offer),
              )
          ],
        ),
      ),
    );
  }
}

