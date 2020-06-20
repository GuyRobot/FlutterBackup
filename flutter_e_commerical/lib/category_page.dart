import 'package:flutter/material.dart';
import 'package:flutterecommerical/animation/Animation.dart';

class Category extends StatefulWidget {
  final String title;
  final String img;

  const Category({Key key, this.title, this.img}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Hero(
                tag: widget.img + widget.title,
                child: Material(
                  child: Container(
                    height: 260,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.img), fit: BoxFit.cover)),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.2)
                          ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.arrow_back_ios),
                                    color: Colors.white,
                                    iconSize: 18,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      FadeAnimation(
                                        delay: 0.6,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.search,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      FadeAnimation(
                                        delay: 0.72,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      FadeAnimation(
                                        delay: 0.84,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.shopping_cart,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                          onPressed: () {},
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          FadeAnimation(
                            delay: 0.96,
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 32),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FadeAnimation(
                          delay: 1,
                          child: Text(
                            "New Product",
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                                fontSize: 18),
                          ),
                        ),
                        FadeAnimation(
                          delay: 1.06,
                          child: Row(
                            children: <Widget>[
                              Text(
                                "View More",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 12,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    FadeAnimation(
                      delay: 1.2,
                      child: makeProduct(
                          image: 'assets/images/beauty-1.jpg',
                          title: "Beauty",
                          price: "100\$"),
                    ),
                    FadeAnimation(
                      delay: 1.32,
                      child: makeProduct(
                          image: 'assets/images/clothes-1.jpg',
                          title: "Cloth",
                          price: "60\$"),
                    ),
                    FadeAnimation(
                      delay: 1.44,
                      child: makeProduct(
                          image: 'assets/images/glass.jpg',
                          title: "Glass",
                          price: "120\$"),
                    ),
                    FadeAnimation(
                      delay: 1.56,
                      child: makeProduct(
                          image: 'assets/images/perfume.jpg',
                          title: "Perfume",
                          price: "80\$"),
                    ),
                    FadeAnimation(
                      delay: 1.68,
                      child: makeProduct(
                          image: 'assets/images/person.jpg',
                          title: "Person",
                          price: "90\$"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget makeProduct({image, title, price}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.06)
            ]),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child:  Icon(Icons.favorite_border, color: Colors.white,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      price,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 26),
                    ),
                  ],
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                  ),
                  child: Center(
                    child: Icon(Icons.add_shopping_cart, color: Colors.grey,),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
