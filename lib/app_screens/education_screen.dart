import 'package:flutter/material.dart';

class EducationApp extends StatefulWidget {
  const EducationApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EducationState();
}

class EducationState extends State<EducationApp> {
  List<EducationBg> eduLst = [
    EducationBg("S.J.K.C (Yuk Chai)", 'Img 1', 'Jan 2001 – Oct 2006'),
    EducationBg("SMK Tropicana", 'Img 2', 'Jan 2007 – Nov 2011'),
    EducationBg("KDU University College (Diploma in Computer Studies)", 'Img 2',
        'Jan 2013 – Dec 2014'),
    EducationBg("KDU University College (Bachelor of Computing HONS)", 'Img 2',
        'Jan 2015 – Dec 2017')
  ];

  List<String> imgLst = [
    'assets/img_0_0.jpg',
    'assets/img_1.jpg',
    'assets/img_2.jpg',
    'assets/img_3.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: eduLst.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Card(
                    margin: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: null,
                    elevation: 10,
                    child: Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Flexible(
                            child: Text('Testing'),
                          ),
                          Container(
                            alignment: Alignment.center, // use aligment
                            color: Color.fromRGBO(0, 96, 91, 1),
                            child: Image.asset(imgLst[index],
                                height: 150, width: 150, fit: BoxFit.fill),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Expanded(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Expanded(
                //         child: Card(
                //           child: SizedBox(
                //             child: Text(eduLst[index]._sSchoolName),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class EducationBg {
  var _sSchoolName, _sImg, sDesc;

  EducationBg(this._sSchoolName, this._sImg, this.sDesc);
}
