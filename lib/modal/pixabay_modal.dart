// class Pixabay {
//   double? total, totalHits;
//   List<Hits> hits;
//
//   Pixabay({required this.total, required this.totalHits, required this.hits});
//
//   factory Pixabay.fromjson(Map m1)
//   {
//     return Pixabay(
//         total: m1['total'], totalHits: m1['totalHits'], hits: m1['hits']);
//   }
//
// }
//
// class Hits {
//   int? id,
//       previeWidth,
//       previewHeight,
//       webformatWidth,
//       webformatHeight,
//       imageWidth,
//       imageHeight,
//       imageSize,
//       views,
//       downloads,
//       collections,
//       likes,
//       comments,
//       user_id;
//
//   String? pageUrl,
//       type,
//       tags,
//       previewURL,
//       webformateURL,
//       largeImageURL,
//       user,
//       userImageURL;
//
//   Hits({
//     required this.id,
//     required this.collections,
//     required this.comments,
//     required this.downloads,
//     required this.imageHeight,
//     required this.imageSize,
//     required this.imageWidth,
//     required this.largeImageURL,
//     required this.likes,
//     required this.pageUrl,
//     required this.previewHeight,
//     required this.previeWidth,
//     required this.previewURL,
//     required this.tags,
//     required this.type,
//     required this.user,
//     required this.user_id,
//     required this.userImageURL,
//     required this.views,
//     required this.webformateURL,
//     required this.webformatHeight,
//     required this.webformatWidth});
//
//   factory Hits.fromJson(Map m1)
//   {
//     return Hits(id: m1['id'],
//         collections: m1['collections'],
//         comments: m1['comments'],
//         downloads: m1['downloads'],
//         imageHeight: m1['imageHeight'],
//         imageSize: m1 ['imageSize'],
//         imageWidth: m1['imageWidth'],
//         largeImageURL: m1['largeImageURL'],
//         likes: m1['likes'],
//         pageUrl: m1['pageUrl'],
//         previewHeight: m1['previewHeight'],
//         previeWidth: m1['previeWidth'],
//         previewURL: m1['previewURL'],
//         tags: m1['tags'],
//         type: m1['type'],
//         user: m1['user'],
//         user_id: m1['user_id'],
//         userImageURL: m1['userImageURL'],
//         views: m1['views'],
//         webformateURL: m1['webformateURL'],
//         webformatHeight: m1['webformatHeight'],
//         webformatWidth: m1['webformatWidth']);
//   }
// }
//
class PixabayModel {
  int? total, totalHits;
  List<Hits>? hits;

  PixabayModel({
    required this.total,
    required this.totalHits,
    required this.hits,
  });

  factory PixabayModel.fromJson(Map m1) {
    return PixabayModel(
      total: m1['total'],
      totalHits: m1['totalHits'],
      hits: (m1['hits'] as List)
          .map(
            (e) => Hits.fromJson(e),
      )
          .toList(),
    );
  }
}

class Hits {
  int? id,
      previewWidth,
      previewHeight,
      webformatWidth,
      webformatHeight,
      imageWidth,
      imageHeight,
      imageSize,
      views,
      downloads,
      collections,
      likes,
      comments,
      user_id;
  String? pageURL,
      type,
      tags,
      previewURL,
      webformatURL,
      largeImageURL,
      user,
      userImageURL;

  Hits({
    required this.id,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.user_id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.webformatURL,
    required this.largeImageURL,
    required this.user,
    required this.userImageURL,
  });

  factory Hits.fromJson(Map m1) {
    return Hits(
      id: m1['id'],
      previewWidth: m1['previewWidth'],
      previewHeight: m1['previewHeight'],
      webformatWidth: m1['webformatWidth'],
      webformatHeight: m1['webformatHeight'],
      imageWidth: m1['imageWidth'],
      imageHeight: m1['imageHeight'],
      imageSize: m1['imageSize'],
      views: m1['views'],
      downloads: m1['downloads'],
      collections: m1['collections'],
      likes: m1['likes'],
      comments: m1['comments'],
      user_id: m1['user_id'],
      pageURL: m1['pageURL'],
      type: m1['type'],
      tags: m1['tags'],
      previewURL: m1['previewURL'],
      webformatURL: m1['webformatURL'],
      largeImageURL: m1['largeImageURL'],
      user: m1['user'],
      userImageURL: m1['userImageURL'],
    );
  }
}
