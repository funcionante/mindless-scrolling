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
        // unique key to reset likes/dislikes when choosing an option
        child: ItemList(option: option, key: UniqueKey(),),
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

class ItemList extends StatefulWidget {
  final String option;

  const ItemList({Key key, this.option}) : super(key: key);

  @override
  ItemListState createState() {
    return new ItemListState();
  }
}

class ItemListState extends State<ItemList> {
  List<bool> likes;
  List<bool> dislikes;

  @override
  void initState() {
    super.initState();
    likes = sampleItems.map((_) => false).toList();
    dislikes = sampleItems.map((_) => false).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Item> items = sampleItems;

    if (widget.option == 'A') {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return ItemView(
            item: item,
            liked: likes[index],
            disliked: dislikes[index],
            onLikePressed: () => onLikePressed(index),
            onDislikePressed: () => onDislikePressed(index),
          );
        },
      );
    }

    final PageController controller = PageController();

    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: items.map((item) {
        int index = items.indexOf(item);
        return OptionBView(
          item: item,
          pageController: controller,
          liked: likes[index],
          disliked: dislikes[index],
          onLikePressed: () => onLikePressed(index),
          onDislikePressed: () => onDislikePressed(index),
        );
      }).toList(),
    );
  }

  void onLikePressed(index) {
    setState(() {
      likes[index] = !likes[index];
      dislikes[index] = false;
    });
  }

  void onDislikePressed(index) {
    setState(() {
      likes[index] = false;
      dislikes[index] = !dislikes[index];
    });
  }
}

class OptionBView extends StatefulWidget {
  final Item item;
  final PageController pageController;

  final liked;
  final disliked;

  final VoidCallback onLikePressed;
  final VoidCallback onDislikePressed;

  const OptionBView({Key key, this.item, this.pageController,
    this.liked, this.disliked, this.onLikePressed, this.onDislikePressed,
  }) : super(key: key);

  @override
  OptionBViewState createState() => OptionBViewState();
}

class OptionBViewState extends State<OptionBView> {
  /// the scroll controller of the item view
  ScrollController _controller;

  /// flag to indicate that the scroll movement can be interpreted to change
  /// to other page (with other item view)
  bool _mightChangePage;

  /// collection of offset updates from a scroll event since the finger touches the screen
  List<_OffsetLog> _offsets;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();

    _mightChangePage = false;
    _offsets = [];
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (PointerMoveEvent event) {
        // ignore this if the controller is no longer being used; it will
        // happen when the page already changed but the finger is still in
        // contact with the screen
        if (!_controller.hasClients) return;

        // ifnore this if there is no indication that the page can be changed;
        // it will happen when onPointerMove is called several times, so only
        // the first time will be counted
        if (!_mightChangePage) return;

        // get the offset of the current update
        double offset = event.delta.dy;

        // update the collection of offsets
        _offsets.add(_OffsetLog(offset, DateTime.now()));

        // get only the offsets from the last ms,
        // so slight involuntary movements are ignored over time
        List<_OffsetLog> lastOffsets = _offsets.where((o) => o.timestamp.compareTo(DateTime.now().subtract(Duration(milliseconds: 50))) > 0).toList();

        // calculate the sum of the last offsets
        double totalOffset = 0.0;
        lastOffsets.forEach((o) => totalOffset += o.offset);

        // ignore this if the finger movement (total offset) is not big enough
        if (totalOffset.abs() < 32.0) return;

        // prepare to change the page

        // do not indicate that the page can be changed anymore, because it is
        // about to be changed now
        _mightChangePage = false;

        // if the scroll is upwards and the list is totally scrolled, move to the next page
        // else if the scroll is downwards and the list has no scroll, move to the previous page
        if (offset.isNegative && _controller.position.pixels == _controller.position.maxScrollExtent) {
          widget.pageController.animateToPage(widget.pageController.page.round() + 1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
        } else if (!offset.isNegative && _controller.position.pixels == 0) {
          widget.pageController.animateToPage(widget.pageController.page.round() - 1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
        }
      },
      onPointerDown: (_) {
        _mightChangePage = true;
        _offsets = [];
      },
      onPointerUp: (_) {},
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40.0 + 60.0),
        controller: _controller,
        child: ItemView(
          item: widget.item,
          liked: widget.liked,
          disliked: widget.disliked,
          onLikePressed: widget.onLikePressed,
          onDislikePressed: widget.onDislikePressed,
        ),
      ),
    );
  }
}

class _OffsetLog {
  final double offset;
  final DateTime timestamp;

  _OffsetLog(this.offset, this.timestamp);
}

class ItemView extends StatefulWidget {
  final Item item;

  final liked;
  final disliked;

  final VoidCallback onLikePressed;
  final VoidCallback onDislikePressed;

  const ItemView({Key key, this.item, this.liked, this.disliked,
  this.onLikePressed, this.onDislikePressed}) : super(key: key);

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
              AspectRatio(aspectRatio: 3/2, child: Image.asset(widget.item.imagePath, fit: BoxFit.cover,)),
              SizedBox(height: 4.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0,),
                child: Text(
                  widget.item.title,
                  style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.bold,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0,),
                child: AnimatedCrossFade(
                  firstChild: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                      children: [
                        TextSpan(text: widget.item.description.substring(0, widget.item.description.length > 120 ? 120 : widget.item.description.length)),
                        TextSpan(text: '...'),
                        TextSpan(text: ' Ver Mais', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    maxLines: 3,
                  ),
                  secondChild: Text(widget.item.description, style: TextStyle(fontSize: 15.0),),
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
              color: widget.liked ? Colors.green : Colors.grey,
              onPressed: () => widget.onLikePressed(),
            ),
            IconButton(
              icon: Icon(Icons.thumb_down),
              color: widget.disliked ? Colors.red : Colors.grey,
              onPressed: () => widget.onDislikePressed(),
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
