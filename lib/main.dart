import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scrolling_news/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String STATE_MENU = '0';
  static const String STATE_A = 'A';
  static const String STATE_B = 'B';

  String _state;
  String _previousState;

  int _tapCounter;

  @override
  void initState() {
    super.initState();
    _state = STATE_MENU;
    _previousState = STATE_MENU;

    _tapCounter = 0;
  }

  @override
  Widget build(BuildContext context) {
    _updateState(String newState) {
      setState(() {
        _previousState = _state;
        _state = newState;
      });
    };

    _getContent() {
      List<Item> items = sampleItems;

      String option = _state != STATE_MENU ? _state : _previousState;

      return GestureDetector(
        onTap: () {
          _tapCounter++;

          if (_tapCounter == 1) {
            Timer(const Duration(seconds: 1), () {
              if (_tapCounter == 4) {
                _updateState(STATE_MENU);
              }

              _tapCounter = 0;
            });
          }
        },
        child: option == STATE_A ? OptionA(items: items) : OptionB(items: items),
      );
    }

    return Scaffold(
      body: AnimatedCrossFade(
        duration: const Duration(seconds: 1),
        firstChild: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Menu(onTap: (String option) {
            if (option == 'A') {
              _updateState(STATE_A);
            } else {
              _updateState(STATE_B);
            }
          }),
        ),
        secondChild: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: _getContent(),
        ),
        crossFadeState: _state == STATE_MENU ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
    );
  }
}

class Menu extends StatelessWidget {
  final Color colorA = Colors.black87;
  final Color colorB = Colors.white;

  final Function(String) onTap;

  const Menu({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: () => onTap('A'),
            child: Container(
              child: Center(
                child: Text(
                  'A',
                  style: TextStyle(fontSize: 128.0, color: colorA),
                ),
              ),
              color: colorB,
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () => onTap('B'),
            child: Container(
              child: Center(
                child: Text(
                  'B',
                  style: TextStyle(fontSize: 128.0, color: colorB),
                ),
              ),
              color: colorA,
            ),
          ),
        ),
      ],
    );
  }
}

class OptionA extends StatelessWidget {
  final List<Item> items;

  const OptionA({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        return ItemView(item: item);
      },
    );
  }
}

class OptionB extends StatelessWidget {
  final List<Item> items;

  const OptionB({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: items.map((item) => ItemView(item: item,)).toList(),
    );
  }
}

class ItemView extends StatelessWidget {
  final Item item;

  const ItemView({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(item.imagePath),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(item.description),
        ),
        SizedBox(height: 64.0,),
      ],
    );
  }
}
