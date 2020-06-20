import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_film_ui/model/Movie.dart';
import 'package:flutter_film_ui/screens/ContentFilmView.dart';
import 'package:flutter_film_ui/widgets/CustomWidgets.dart';

class MovieDetail extends StatefulWidget {
  final Movie movie ;

  MovieDetail({@required this.movie});
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0, -50, 0),
                child: Hero(
                  tag: widget.movie.imageUrl,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20),
                    child: Image(
                      image: AssetImage(widget.movie.imageUrl),
                      width: double.infinity,
                      height: 420,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 32),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    iconSize: 32,
                  ),
                  Image(
                    image: AssetImage('images/netflix_logo.png'),
                    height: 60,
                    width: 160,
                  ),
                  IconButton(
                    padding: EdgeInsets.only(right: 16),
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    iconSize: 32,
                  ),
                ],
              ),
              Positioned.fill(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: RawMaterialButton(
                  fillColor: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.all(12),
                  onPressed: () {},
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.play_arrow,
                    size: 60,
                    color: Colors.deepOrange,
                  ),
                ),
              )),
              Positioned(
                bottom: 0,
                left: 20,
                child: IconButton(
                  icon: Icon(Icons.style, color: Colors.black,),
                  onPressed: (){

                  },
                  iconSize: 32,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 20,
                child: IconButton(
                  icon: Icon(Icons.shop_two, color: Colors.black,),
                  onPressed: (){

                  },
                  iconSize: 32,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 36,
              vertical: 24
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.movie.title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  widget.movie.categories,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.8),
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "⭐ ⭐ ⭐ ⭐",
                  style: TextStyle(
                      fontSize: 25
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Year",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey
                            ),
                          ),
                          Text(
                            '${widget.movie.year}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "Country",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey
                            ),
                          ),
                          Text(
                            widget.movie.country,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "Length",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey
                            ),
                          ),
                          Text(
                            '${widget.movie.length}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.movie.description,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          ContentFilmView(
            images: widget.movie.screenshots,
            title: "Section",
            imageHeight: 260,
            imageWidth: 160,
          )
        ],
      ),
    );
  }
}
