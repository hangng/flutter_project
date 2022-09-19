import 'package:flutter/material.dart';
import 'package:flutterproject/app_screens/education_screen.dart';
import 'package:flutterproject/app_screens/lunch_screen.dart';
import 'package:flutterproject/app_screens/profile_screen.dart';

class EducationMenu extends StatefulWidget {
  const EducationMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EducationMenuState();
}

class EducationMenuState extends State<EducationMenu> {
  final int EDUC = 1;

  List<menuItems> menuLst = [
    menuItems('Profile', 'ABC', 'img_1'),
    menuItems('School/College', 'ABC', 'img_1'),
    menuItems('Achievement', 'ABC', 'img_1'),
  ];

  List<Color> colorLst = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuLst.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Card(
              margin: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 10,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                focusColor: Colors.yellow,
                onTap: () {
                  setState(() {
                    options(context, index);
                  });
                },
                child: Container(
                  height: 100,
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          '${menuLst[index]._menuName}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.face,
                        size: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class menuItems {
  var _menuName, _menuDesc, _menuImg;

  menuItems([this._menuName, this._menuDesc, this._menuImg]);

  get menuImg => _menuImg;

  get menuDesc => _menuDesc;

  get menuName => _menuName;
}

void options(BuildContext context, int iPosition) {
  if (iPosition == 0) {
    print('position = $iPosition');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ProfileApp()));
  } else if (iPosition == 1) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => EducationApp()));
    print('position = $iPosition');
  } else if (iPosition == 2) {
    print('position = $iPosition');
  }
}
