import 'package:flutter/material.dart';

class VisibilityExample extends StatefulWidget {
  @override
  _VisibilityExampleState createState() {
    return _VisibilityExampleState();
  }
}

class _VisibilityExampleState extends State<VisibilityExample> {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visibility Tutorial by Woolha.com',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Visibility Tutorial by Woolha.com'),
          ),
          body: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  child: Text('Show/Hide Card B'),
                  onPressed: showToast,
                ),
                Card(
                  child: new ListTile(
                    title: Center(
                      child: new Text('A'),
                    ),
                  ),
                ),
                Visibility(
                  visible: _isVisible,
                  child: Card(
                    child: new ListTile(
                      title: Center(
                        child: new Text('B'),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: new ListTile(
                    title: Center(
                      child: new Text('C'),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

void main() => runApp(VisibilityExample());
