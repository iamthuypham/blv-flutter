import 'package:flutter_web/material.dart';

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Home'),
  Choice(title: 'About Us'),
  Choice(title: 'Ways to Help'),
  Choice(title: 'Our Projects'),
  Choice(title: 'Contact Us'),
  Choice(title: 'Donate'),
  Choice(title: 'Social Links'),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
