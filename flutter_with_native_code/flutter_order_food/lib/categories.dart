import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 120,
            child: Column(
              children: <Widget>[
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.amber.withOpacity(0.6),
                            offset: Offset(3, 6),
                            blurRadius: 6)
                      ]),
                  child: ListTile(
                    title: Image.asset("images/salad.png"),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Salad",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
