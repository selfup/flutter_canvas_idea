import 'package:flutter/material.dart';

import 'entity.dart';
import 'sprite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canvas Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Canvas Demo'),
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
  double _xPos = 50.0;
  double _yPos = 50.0;

  double _enemyYPos = 0.0;
  double _enemyXPos = 100.0;

  double _velocity = 1.5;
  double _enemyVelocity = 0.5;

  String _direction = 's';

  List<Sprite> _entities = [];

  Future gameLoop() async {
    await Future.delayed(Duration(milliseconds: 14));

    setState(() {
      _enemyYPos += _enemyVelocity;
      switch (_direction) {
        case 'r':
          _xPos += _velocity;
          break;
        case 'l':
          _xPos -= _velocity;
          break;
        case 'u':
          _yPos -= _velocity;
          break;
        case 'd':
          _yPos += _velocity;
          break;
        case 's':
          break;
        default:
          break;
      }

      List<Sprite> entities = [];

      entities.add(Sprite(_xPos, _yPos, Colors.red));
      entities.add(Sprite(_enemyXPos, _enemyYPos, Colors.yellow));
      entities.add(Sprite(_enemyXPos + 50.0, _enemyYPos, Colors.green));
      entities.add(Sprite(_enemyXPos + 100.0, _enemyYPos, Colors.purple));

      _entities = entities;
    });

    return await gameLoop();
  }

  void move(String dir) {
    setState(() {
      _direction = dir;
    });
  }

  @override
  initState() {
    super.initState();

    List<Sprite> entities = [];

    entities.add(Sprite(_xPos, _yPos, Colors.red));
    entities.add(Sprite(_enemyXPos, _enemyYPos, Colors.yellow));
    entities.add(Sprite(_enemyXPos + 50.0, _enemyYPos, Colors.green));
    entities.add(Sprite(_enemyXPos + 100.0, _enemyYPos, Colors.purple));

    setState(() {
      _entities = entities;
    });

    () async {
      await this.gameLoop();
    }();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        decoration: new BoxDecoration(color: Colors.black87),
        child: AspectRatio(
          aspectRatio: 0.682,
          child: Container(
            child: CustomPaint(painter: Entity(_entities)),
          ),
        ),
      ),
      floatingActionButton: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.up,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                move('r');
              },
              backgroundColor: Colors.cyan,
              child: Icon(Icons.arrow_right),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            FloatingActionButton(
              onPressed: () {
                move('l');
              },
              backgroundColor: Colors.deepOrange,
              child: Icon(Icons.arrow_left),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            FloatingActionButton(
              onPressed: () {
                move('u');
              },
              backgroundColor: Colors.orange,
              child: Icon(Icons.arrow_drop_up),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            FloatingActionButton(
              onPressed: () {
                move('d');
              },
              backgroundColor: Colors.green,
              child: Icon(Icons.arrow_drop_down),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            FloatingActionButton(
              onPressed: () {
                move('s');
              },
              backgroundColor: Colors.purple,
              child: Icon(Icons.stop),
            ),
          ],
        ),
      ),
    );
  }
}
