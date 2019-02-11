import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrolling_news/data.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // force vertical orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

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
    }

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
      padding: const EdgeInsets.symmetric(vertical: 40.0),
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
  final PageController controller = PageController();

  OptionB({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: items.map((item) => OptionBView(item: item, pageController: controller,)).toList(),
    );
  }
}

class OptionBView extends StatefulWidget {
  final Item item;
  final PageController pageController;

  const OptionBView({Key key, this.item, this.pageController}) : super(key: key);

  @override
  OptionBViewState createState() {
    return new OptionBViewState();
  }
}

class OptionBViewState extends State<OptionBView> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();

    // wait for the first build,
    // only then the isScrollingNotifier can be accessed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('ok');
      _controller.position.isScrollingNotifier.addListener(() {
        print('ok2');
        if (_controller.position.isScrollingNotifier.value) {
          if (_controller.position.pixels == _controller.position.maxScrollExtent) {
            Timer(const Duration(milliseconds: 100), () {
              if (_controller.position.pixels == _controller.position.maxScrollExtent) {
                widget.pageController.animateToPage(widget.pageController.page.round() + 1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
              }
            });
          } else if (_controller.position.pixels == 0.0) {
            Timer(const Duration(milliseconds: 100), () {
              if (_controller.position.pixels == 0.0) {
                widget.pageController.animateToPage(widget.pageController.page.round() - 1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
              }
            });
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 40.0 + 60.0),
      controller: _controller,
      child: ItemView(
        item: widget.item,
      ),
    );
  }
}

class ItemView extends StatefulWidget {
  final Item item;

  const ItemView({Key key, this.item}) : super(key: key);

  @override
  _ItemViewState createState() => new _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Column(
            children: <Widget>[
              AspectRatio(aspectRatio: 4/3, child: Image.asset(widget.item.imagePath, fit: BoxFit.cover,)),
              SizedBox(height: 4.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0,),
                child: Text(
                  widget.item.title,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,),
                ),
              ),
//        SizedBox(height: 8.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0,),
                child: AnimatedCrossFade(
                  firstChild: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: widget.item.description.substring(0, widget.item.description.length > 120 ? 120 : widget.item.description.length)),
                        TextSpan(text: '...'),
                        TextSpan(text: ' Ver Mais', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    maxLines: 3,
                  ),
                  secondChild: Text(widget.item.description),
                  crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 250),
                ),
              ),
            ],
          ),
        ),
        _isExpanded ? GestureDetector(
          onTap: () => widget.item.url != null ? launch(widget.item.url) : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('${widget.item.date} in NiT', style: TextStyle(color: Colors.grey),),
          ),
        ) : SizedBox(height: 0.0,),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.thumb_up),
              color: Colors.grey,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.thumb_down),
              color: Colors.grey,
              onPressed: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(height: 16.0,),
        ),
      ],
    );
  }
}
