import 'package:flutter/cupertino.dart';
import 'package:pixabay_apicalling/helper/api_helper.dart';
import 'package:pixabay_apicalling/modal/pixabay_modal.dart';

class HomeProvider extends ChangeNotifier
{
  PixabayModel?  pixabay;

  Future<void> fetchPhotos()
  async {
    Map json = await ApiHelper.apiHelper.fethchApiData();
   pixabay =  PixabayModel.fromJson(json);
   notifyListeners();
  }
  HomeProvider()
  {
    fetchPhotos();
  }
}

