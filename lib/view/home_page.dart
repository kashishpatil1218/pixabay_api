import 'package:flutter/material.dart';
import 'package:pixabay_apicalling/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../modal/pixabay_modal.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.black,
      appBar: AppBar(
backgroundColor: Colors.black,
        elevation: 8,
        shadowColor: Colors.black,
        title: Text(
          'Pixabay',
          style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search,color: Colors.white,),
          )
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          if (provider.pixabay != null) {
            return ListView.builder(
              itemCount: provider.pixabay!.hits!.length,
              itemBuilder: (context, index) => photoBox(
                dis: provider.pixabay!.hits![index].tags.toString(),

                dwn: provider.pixabay!.hits![index].downloads.toString(),
                comment: provider.pixabay!.hits![index].comments.toString(),
                fav: provider.pixabay!.hits![index].likes.toString(),
                  photo:
                      provider.pixabay!.hits![index].largeImageURL.toString(),
                  UserImage:
                      provider.pixabay!.hits![index].userImageURL.toString(),
                  UserName: provider.pixabay!.hits![index].user.toString()),
            );
          }
          return Center(
            child: Text("data!!!!!!!!!!!!!!!!!!!0"),
          );
        },
      ),
    );
  }
}

Widget photoBox(
    {required String UserImage,
    required String UserName,
    required String photo,
    required String comment,
    required String dis,
    required String dwn,
    required String fav}) {
  return Container(
    height:500,
    width: double.infinity,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius:25,
            backgroundImage: NetworkImage(UserImage),
          ),
          title: Text(
            UserName,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,color: Colors.white),
          ),
          subtitle: Text(dis,style: TextStyle(fontSize:18,color: Colors.grey ),),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              photo,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10,width: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(

            children: [
              Icon(Icons.favorite,size: 30,color: Colors.red,),
              Text(fav,style: TextStyle(color: Colors.grey.shade800,fontSize: 25),),
              SizedBox(width:20,),
              Icon(Icons.comment,size: 30,color: Colors.grey.shade600,),
              Text(comment,style: TextStyle(color: Colors.grey.shade800,fontSize: 25),),
              SizedBox(width:20,),
              Icon(Icons.download,size: 30,color: Colors.grey.shade600,),
              Text(dwn,style: TextStyle(color: Colors.grey.shade800,fontSize: 25),),



            ],
          ),
        )
      ],
    ),
  );
}
