import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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
        children: <Widget>[CustomBody(), CustomAppbar(), Nav()],
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Column(
        children: <Widget>[
          Section(
            headline: "Meditation",
            description: "Descover Happiness",
            imageProvider: AssetImage("images/dessert.jpg"),
          ),
          Section(
            headline: "Dream Asomewe",
            description: "Fantasy Happiness",
            imageProvider: AssetImage("images/galaxy.jpg"),
          )
        ],
      ),
      Center(
        child: ClipPath(
          clipper: CustomMidClipper(),
          child: Section(
            headline: "Sensations",
            description: "Just Feel Better",
            imageProvider: AssetImage("images/beach.jpg"),
          ),
        ),
      )
    ]);
  }
}

class Section extends StatelessWidget {
  final String headline;
  final String description;
  final ImageProvider imageProvider;

  Section({this.headline, this.description, this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: headline,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
              children: <TextSpan>[
                TextSpan(
                    text: '$description',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: headline,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500))
              ]),
        ),
      ),
    );
  }
}

class CustomMidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    var sw = size.width;
    var sh = size.height;
    path.cubicTo(0, sh * 0.3, sw, sh * 0.2, sw, sh * 0.45);
    path.lineTo(sw, sh);
    path.cubicTo(sw, sh * 0.7, 0, sh * 0.8, 0, sh * 0.56);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: ClipPath(
            clipper: NavBarClipper(),
            child: Container(
              height: 68,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff1e1e1e),
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xff1e1e1e),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey.shade100,
                  child: Icon(
                    Icons.bubble_chart,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xff1e1e1e),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey.shade100,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xff1e1e1e),
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey.shade100,
                  child: Icon(
                    Icons.style,
                    color: Colors.blueAccent,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Focus",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Text(
                "Ralax",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Text(
                "Enjoy",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              )
            ],
          ),
        )
      ],
    );
  }
}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    var sw = size.width;
    var sh = size.height;
    path.cubicTo(sw / 12, 0, sw / 12, sh * 2 / 5, sw / 6, sh * 2 / 5);
    path.cubicTo(sw / 4, sh * 2 / 5, sw / 4, 0, sw / 3, 0);
    path.cubicTo(5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, sw / 2, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.cubicTo(
        9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo(11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    var sw = size.width;
    var sh = size.height;
    path.lineTo(0, sh);
    path.lineTo(4 * sw / 12, sh);
    path.cubicTo(5 * sw / 12, sh, 5 * sw / 12, 1 * sh / 3, 6 * sw / 12, 1 * sh / 3);
    path.cubicTo(7 * sw / 12, sh / 3, 7 * sw / 12, sh, 8 * sw / 12, sh);
    path.lineTo(sw, sh);
    path.lineTo(sw, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class NavIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 26,
      backgroundColor: Colors.grey.shade100,
      child: Icon(
        Icons.bubble_chart,
        color: Colors.blue,
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black87, Colors.transparent])),
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: AppBarClipper(),
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffaba192),
            ),
          ),
          Positioned(
            top: 32,
            left: MediaQuery.of(context).size.width / 2 - 24,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.grey.shade100,
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage("images/face.jpg"),
                )
              ],
            ),
          ),
          Positioned(
            top: 72,
            left: MediaQuery.of(context).size.width / 2 - 12,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: FittedBox(
                child: Icon(Icons.add, color: Colors.black54,),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white,),
                onPressed: (){

                },
              ),
              IconButton(
                icon: Icon(Icons.menu, color: Colors.white,),
                onPressed: (){

                },
              )
            ],
          )
        ],
      ),
    );
  }
}
