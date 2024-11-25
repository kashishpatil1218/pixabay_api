import 'package:flutter/cupertino.dart';
import 'package:pixabay_apicalling/helper/api_helper.dart';
import 'package:pixabay_apicalling/modal/pixabay_modal.dart';

class HomeProvider extends ChangeNotifier
{
  Pixabay?  pixabay;
  Pixabay? searchResults;

  Future<void> fetchPhotosResult(String search)
  async {
   Map json = await ApiHelper.apiHelper.fetchApiDataBySearch(search);
    searchResults = Pixabay.fromJson(json);
    notifyListeners();
  }

  Future<void> fetchPhotos()
  async {
    Map json = await ApiHelper.apiHelper.fethchApiData();
   pixabay =  Pixabay.fromJson(json);
   notifyListeners();
  }
  HomeProvider()
  {
    fetchPhotos();
  }
}

