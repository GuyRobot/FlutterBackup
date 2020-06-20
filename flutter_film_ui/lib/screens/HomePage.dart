import 'package:flutter/material.dart';
import 'package:flutter_film_ui/model/Movie.dart';
import 'package:flutter_film_ui/screens/ContentFilmView.dart';
import 'package:flutter_film_ui/screens/MovieDetail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }
  _movieSelector(int index){
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, widget){
        double value = 1.0;
        if (_pageController.position.haveDimensions){
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 275.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MovieDetail(movie: movies[index],)
          ));
        },
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      offset: Offset(0, 4),
                      blurRadius: 8
                    )
                  ]
                ),
                child: Center(
                  child: Hero(
                    tag: movies[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        image: AssetImage(movies[index].imageUrl),
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 48,
              left: 32,
              child: Container(
                width: 250,
                child: Text(
                  movies[index].title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          height: 60,
          child: Image(
            image: AssetImage('images/netflix_logo.png'),
//            width: MediaQuery.of(context).size.width,
//            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 28),
          onPressed: (){

          },
          icon: Icon(Icons.menu),
          iconSize: 32,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 28),
            onPressed: (){

            },
            icon: Icon(Icons.style),
            color: Colors.black,
            iconSize: 32,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 280,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
                itemCount: movies.length,
                itemBuilder: (context, index){
                return _movieSelector(index);
                }),
          ),
          Container(
            height: 80,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: labels.length,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.all(8),
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xFFD45235),
                        Color(0xFF9E1F28)
                      ]
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF9E1F28),
                        offset: Offset(0, 2),
                        blurRadius: 6
                      )
                    ]
                  ),
                  child: Center(
                    child: Text(
                      labels[index].toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.8
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ContentFilmView(
            images: myList,
            title: "Gallary Film",
            imageHeight: 260,
            imageWidth: 160,
          ),
          SizedBox(
            height: 18,
          ),
          ContentFilmView(
            images: popular,
            title: "Gergeous Film",
            imageHeight: 260,
            imageWidth: 160,
          ),
        ],
      ),
    );
  }
}
