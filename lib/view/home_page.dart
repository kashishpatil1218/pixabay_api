import 'package:flutter/material.dart';
import 'package:pixabay_apicalling/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../modal/pixabay_modal.dart';

TextEditingController txtSearch = TextEditingController();

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
        title: TextField(
          controller: txtSearch,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(

              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: IconButton(
                  onPressed: () {
                    Provider.of<HomeProvider>(context,listen: false).fetchPhotosResult(txtSearch.text);
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ))),
        ),

      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {

          if (provider.pixabay != null && provider.searchResults==null) {
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
          else if(provider.searchResults!=null)
            {
              return ListView.builder(
                itemCount: provider.searchResults!.hits!.length,
                itemBuilder: (context, index) => photoBox(
                    dis: provider.searchResults!.hits![index].tags.toString(),
                    dwn: provider.searchResults!.hits![index].downloads.toString(),
                    comment: provider.searchResults!.hits![index].comments.toString(),
                    fav: provider.searchResults!.hits![index].likes.toString(),
                    photo:
                    provider.searchResults!.hits![index].largeImageURL.toString(),
                    UserImage:
                    provider.searchResults!.hits![index].userImageURL.toString(),
                    UserName: provider.searchResults!.hits![index].user.toString()),
              );
            }
          return Center(
            child: CircularProgressIndicator(),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              photo,
              fit: BoxFit.cover,
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

