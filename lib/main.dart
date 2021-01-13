import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gamyu character',
      home: Grade(),
    );
  }
}

class Grade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text('Fucked up!'),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
        elevation: 12,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('assets/haru_g_m06.gif'),
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[850],
              thickness: 0.5,
            ),
            Text(
              'NAME',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 3.9,
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              'GAM YU',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Level',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 3.9,
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              '78',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Weapon : Ice Elbow',
                  style: TextStyle(
                    fontSize: 19,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Liyue Harbor Secretary',
                  style: TextStyle(
                    fontSize: 19,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Beautiful Ice Flowers',
                  style: TextStyle(
                    fontSize: 19,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/haru_g_m07_019.png'),
                radius: 50,
                backgroundColor: Colors.blue[200],
              ),
            )
          ],
        ),
      ),
    );
  }
}
