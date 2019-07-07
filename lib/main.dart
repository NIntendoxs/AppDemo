import 'package:flutter/material.dart';
import 'package:watson_assistant/watson_assistant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
/*import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'echo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int bottomSelectedIndex = 1;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.place),
          title: new Container(height: 0.0)
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.home),
        title: Container(height: 0.0)
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Container(height: 0.0)
      )
    ];
  }

  PageController pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  Widget buildPageView() {
    MaterialPageRoute(builder: (context) => Usuario());
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      scrollDirection: Axis.horizontal,

      children: <Widget>[
        Maps(),
        Inicio(),
        Usuario(),
      ],

    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 350), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,

        ),

      ),
      body: buildPageView(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}



class Red extends StatefulWidget {
  @override
  _RedState createState() => _RedState();
}

class _RedState extends State<Red> {
  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setStatusBarColor(Colors.red);
    /*FlutterStatusbarcolor.setStatusBarWhiteForeground(false);*/
    //FlutterStatusbarcolor.setNavigationBarColor(Colors.red);
    //FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    return Container(
      color: Colors.red,
      child: Text("Hola :v"),

    );
  }
}

/*class Blue extends StatefulWidget {
  @override
  _BlueState createState() => _BlueState();
}

class _BlueState extends State<Blue> {
  @override

  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setStatusBarColor(Colors.blueAccent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    //FlutterStatusbarcolor.setNavigationBarColor(Colors.blueAccent);
    //FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    return Container(
      color: Colors.blueAccent,
      child: Text("Azul",textAlign: TextAlign.center,),
    );
  }
}*/

/*class Yellow extends StatefulWidget {
  @override
  _YellowState createState() => _YellowState();
}

class _YellowState extends State<Yellow> {
  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setStatusBarColor(Colors.yellowAccent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    //FlutterStatusbarcolor.setNavigationBarColor(Colors.yellowAccent);
    //FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);

    MaterialPageRoute(builder: (context) => Usuario());
    return Container(
      child: Usuario(),
      //color: Colors.yellowAccent,
    );
  }
}*/
class Inicio extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido"),
      ),
      body: Center(

      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: null),
    );
  }
}

class Usuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuenta de Usuario"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.dialpad),
          onPressed: () {print("Llamando");}
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}





class Maps extends StatelessWidget {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Sample App'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}