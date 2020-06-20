import 'package:flutter/material.dart';
import 'package:flutter_film_ui/screens/MovieDetail.dart';

class ContentFilmView extends StatelessWidget {
  final List<String> images;
  final String title;
  final double imageHeight;
  final double imageWidth;
  ContentFilmView({this.images, this.title, this.imageHeight, this.imageWidth});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  fontSize: 20
                ),
              ),
              GestureDetector(
                onTap: (){
//                  Navigator.of(context).push(MaterialPageRoute(
//                    builder: (context) => MovieDetail(movie: movie,)
//                  ));
                },
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black87,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: imageHeight,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 32),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 24
                ),
                width: imageWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      offset: Offset(0, 4),
                      blurRadius: 6
                    )
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
