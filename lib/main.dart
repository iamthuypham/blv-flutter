import 'package:flutter_web/material.dart';
import 'choice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'Raleway',
        cardColor: Colors.green,
        ,
      home: MyHomePage(title: 'Better Life Vietnam'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    double _getResponsiveAppBarHeight() {
      if (MediaQuery.of(context).size.width <= 425) {
        return 50;
      }
      return 100;
    }

    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: MyAppBar(
          height: _getResponsiveAppBarHeight(),
          logo: Image.asset('logo.png', fit: BoxFit.contain)),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (choose the "Toggle Debug Paint" action
          // from the Flutter Inspector in Android Studio, or the "Toggle Debug
          // Paint" command in Visual Studio Code) to see the wireframe for each
          // widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, World!',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  final Image logo;

  const MyAppBar({
    Key key,
    @required this.height,
    @required this.logo,
  }) : super(key: key);

  @override
  MyAppBarState createState() => MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class MyAppBarState extends State<MyAppBar> {
  Choice _selectedChoice = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Expanded(
        flex: 3,
        child: Container(
          padding:
              EdgeInsets.only(top: widget.height / 8, left: widget.height / 3),
          constraints: BoxConstraints(maxHeight: widget.height),
          child: widget.logo,
          alignment: Alignment.centerLeft,
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          padding:
              EdgeInsets.only(top: widget.height / 8, right: widget.height / 3),
          alignment: Alignment.centerRight,
          child: PopupMenuButton<Choice>(
            icon: Icon(
              Icons.menu,
              color: Colors.green,
            ),
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: Container(
                      height: widget.height, child: Text(choice.title)),
                );
              }).toList();
            },
          ),
        ),
      )
    ]);
  }
}
