import 'package:flutter/material.dart';

class ProfileApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileState();
}

class ProfileState extends State {
  List<Widget> widgetLst = [AboutUsersBar(), CategoryBar()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xff1f005c),
              Color(0xff5b0060),
              Color(0xff870160),
              Color(0xffac255e),
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),
            ],
            // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
        ),
        child: SafeArea(
          child: ListView.builder(
            itemCount: widgetLst.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // put all created widgets into body piece bby piece vertically
                children: [
                  // Container(
                  //   margin: EdgeInsets.all(10),
                  //   child: widgetLst[index],
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget AboutUserBar(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    color: Colors.blue,
    child: Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(5),
                        color: Colors.green,
                        child: Text(
                          "Hi,",
                          style: TextStyle(
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 30),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(5),
                        color: Colors.yellow,
                        child: Text(
                          "Dino Ng",
                          style: TextStyle(
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.red,
                  child: Icon(
                    Icons.ice_skating,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        color: Colors.yellow,
                        child: TextField(
                          decoration: new InputDecoration.collapsed(
                              hintText: 'Enter values '),
                          style: TextStyle(
                            fontSize: AdaptiveTextSize()
                                .getadaptiveTextSize(context, 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Visibility(
                    child: Text("Invisible"),
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget Testing(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.green,
          // child: Expanded(
          child: Text('Testing 3...................'),
          // ),
        ),
        // Container(
        //   color: Colors.yellow,
        //   child: Expanded(
        //     child: Text('Testing 3...................'),
        //   ),
        // ),
        // Container(
        //   color: Colors.red,
        //   child: Expanded(
        //     child: Text('Testing 3...................'),
        //   ),
        // ),
      ],
    ),
  );
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}

class CategoryBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CategoryBarState();
}

class CategoryBarState extends State<CategoryBar> {
  bool tappedOne = false;
  bool clicked = false;
  bool extendBox = false;

  void showToast() {
    setState(() {
      extendBox = !extendBox;
      tappedOne = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
      child: AnimatedSize(
        curve: Curves.bounceOut,
        duration: const Duration(seconds: 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(5),
              color: Colors.yellow,
              child: Text(
                'Category',
                style: TextStyle(
                  fontSize: AdaptiveTextSize().getadaptiveTextSize(context, 30),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  ActionChip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.grey.shade800,
                      child: const Text('01'),
                    ),
                    label: const Text('Chip One'),
                    onPressed: () {
                      setState(
                        () {
                          extendBox = !extendBox;
                        },
                      );
                    },
                  ),
                  ActionChip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.grey.shade800,
                      child: const Text('02'),
                    ),
                    label: const Text('Chip Two'),
                    onPressed: () {
                      setState(
                        () {},
                      );
                    },
                  ),
                  ActionChip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.grey.shade800,
                      child: const Text('03'),
                    ),
                    label: const Text('Chip Three'),
                    onPressed: () {
                      setState(
                        () {
                          tappedOne = !tappedOne;
                        },
                      );
                    },
                  ),
                  Visibility(
                    visible: extendBox,
                    child: AnimatedSize(
                      curve: Curves.bounceIn,
                      duration: const Duration(seconds: 1),
                      child: MyStatefulWidget(selected: tappedOne),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  bool selected = false;

  MyStatefulWidget({Key? key, required this.selected}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  void showToast() {
    setState(() {
      widget.selected = !widget.selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selected = !widget.selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: widget.selected ? 200.0 : 100.0,
          height: widget.selected ? 100.0 : 200.0,
          color: widget.selected ? Colors.red : Colors.blue,
          alignment: widget.selected
              ? Alignment.center
              : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(size: 75),
        ),
      ),
    );
  }
}

class AboutUsersBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutUsersBarState();
}

class AboutUsersBarState extends State<AboutUsersBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(5),
                          color: Colors.green,
                          child: Text(
                            "Hi,",
                            style: TextStyle(
                              fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 30),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(5),
                          color: Colors.yellow,
                          child: Text(
                            "Dino Ng",
                            style: TextStyle(
                              fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red,
                    child: Icon(
                      Icons.ice_skating,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          color: Colors.yellow,
                          child: TextField(
                            decoration: new InputDecoration.collapsed(
                                hintText: 'Enter values '),
                            style: TextStyle(
                              fontSize: AdaptiveTextSize()
                                  .getadaptiveTextSize(context, 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Visibility(
                      child: Text("Invisible"),
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
