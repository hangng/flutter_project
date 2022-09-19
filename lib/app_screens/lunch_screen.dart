import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class LunchApp extends StatefulWidget {
  const LunchApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LunchAppState();
}

class LunchAppState extends State<LunchApp> {
  List<menuList> menuLst = [
    menuList('Cow'),
    menuList('Cat'),
    menuList('Dog'),
    menuList('Mice'),
    menuList('Mouse'),
    menuList('Frog')
  ];
  final sInputEditor = TextEditingController();
  var _TimerCountDown;
  Random random = new Random();
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    sInputEditor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            TextField(
              controller: sInputEditor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('List Size = ${menuLst.length}'),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        menuLst.add(menuList(sInputEditor.text));
                      });
                    },
                    child: Text('Menu'),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(
                            random.nextInt(255),
                            random.nextInt(255),
                            random.nextInt(255),
                            random.nextInt(255)),
                        elevation: 5)),
              ],
            ),
            Expanded(
              child: ListView.separated(
                key: _key,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                itemCount: menuLst.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 20,
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('item ${menuLst[index].sMenuItem}, ${index}'),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (menuLst != null &&
                                      menuLst.length > index) {
                                    menuLst.remove(menuLst[index]);
                                  }
                                });
                              },
                              child: Text('Delete'),
                            ),
                          ],
                        )),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class menuList {
  String sMenuItem = '';

  menuList(this.sMenuItem);
}
