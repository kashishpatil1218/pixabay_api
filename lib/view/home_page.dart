import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pixabay_apicalling/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../modal/pixabay_modal.dart';
import 'component/photoBox_page.dart';

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
              hintStyle: const TextStyle(fontSize: 15),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 0.1),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      log(txtSearch.text);
                      Provider.of<HomeProvider>(context, listen: false)
                          .fetchPhotosResult(txtSearch.text);
                    },
                    icon: Icon(Icons.search)),
              )),
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          if (provider.pixabay != null && provider.searchResults == null) {
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
          } else if (provider.searchResults != null) {
            return ListView.builder(
              itemCount: provider.searchResults!.hits!.length,
              itemBuilder: (context, index) => photoBox(
                  dis: provider.searchResults!.hits![index].tags.toString(),
                  dwn:
                      provider.searchResults!.hits![index].downloads.toString(),
                  comment:
                      provider.searchResults!.hits![index].comments.toString(),
                  fav: provider.searchResults!.hits![index].likes.toString(),
                  photo: provider.searchResults!.hits![index].largeImageURL
                      .toString(),
                  UserImage: provider.searchResults!.hits![index].userImageURL
                      .toString(),
                  UserName:
                      provider.searchResults!.hits![index].user.toString()),

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
