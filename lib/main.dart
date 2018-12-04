import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: Colors.black.withOpacity(0.7),
            ),
            clipper: getPathClipper(),
          ),
          //SizedBox(height: MediaQuery.of(context).size.height / 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/chris.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(75),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7.0,
                      color: Colors.black.withOpacity(0.7),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'MR. FREEMAN',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 25.0,
                ),
              ),
              SizedBox(height: 5.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'Available for freelance',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20.0,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Container(
                height: 30.0,
                width: 100.0,
                alignment: Alignment(0, 0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text('data'),
              )
            ],
          ),
          // ClipRect(
          //   clipper: getRectClipper(),
          //   child: Image.asset('assets/images/chris.jpg'),
          // ),
          // ClipPath(
          //   clipper: getPathClipper(),
          //   child: Image.asset('assets/images/chris.jpg'),
          // )
        ],
      ),
    );
  }
}

class getRectClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    Rect rect = new Rect.fromLTRB(50.0, 50.0, size.width / 2, size.height / 2);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class getPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height / 4);
    path.lineTo(0.0, size.height / 2);

    //path.lineTo(0.0, size.height);
    //path.lineTo(size.width + 200, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
