import 'package:flutter/material.dart';

Widget photoBox(
    {required String UserImage,
      required String UserName,
      required String photo,
      required String comment,
      required String dis,
      required String dwn,

      required String fav}) {
  return Container(
    height: 500,
    width: double.infinity,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.white10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(UserImage),
          ),
          title: Text(
            UserName,
            style: TextStyle(
                fontSize:15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          subtitle: Text(
            dis,
            style: TextStyle(fontSize:14, color: Colors.grey),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                photo,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.favorite,
                size: 20,
                color: Colors.red,
              ),
              SizedBox(width:2.5 ,),
              Text(
                fav,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.comment,
                size: 20,
                color: Colors.grey.shade600,
              ),
              SizedBox(width:2.5 ,),
              Text(
                comment,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.download,
                size: 20,
                color: Colors.grey.shade600,
              ),
              SizedBox(width:2.5 ,),
              Text(
                dwn,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),

            ],
          ),
        )
      ],
    ),
  );
}

