// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(15.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '${map['title']}',
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          Divider(
            color: Colors.blue,
            thickness: 1.0,
          ),
          Text('${map['content']}'),
          SizedBox(
            height: 10,
          ),

          Text('${map['description']}'),
          Divider(
            color: Colors.blue,
            thickness: 1.0,
          ),
          Text('${map['url']}', style: TextStyle(color: Colors.lightBlue),),
          Container(
            
  
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                
              Text('${map['author']}',style: TextStyle(color: Colors.red),textDirection: TextDirection.ltr,),
              Text('${map['publishedAt']}',style: TextStyle(color: Colors.red),textDirection: TextDirection.ltr),

            ]),
          ),
         
          
          //Image.network('${map['urlToImage']}'),
          
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}