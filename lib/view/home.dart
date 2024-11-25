// import 'package:flutter/material.dart';
// import 'package:pixabay_api/provider/homeProvider.dart';
// import 'package:provider/provider.dart';
//
// import 'component/listview_of_photo.dart';
//
// class Homepage extends StatelessWidget {
//   const Homepage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController txtsearch = TextEditingController();
//     HomeProvider provider=Provider.of<HomeProvider>(context,listen: false);
//     HomeProvider providertrue=Provider.of<HomeProvider>(context,listen: true);
//     double Mheight = MediaQuery.sizeOf(context).height;
//     double Mwidth = MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.menu),
//         elevation: 5,
//         shadowColor: Colors.black,
//         centerTitle: true,
//         title: const Text(
//           'PixVault',
//           style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
//         ),
//         actions: [IconButton(onPressed: () {}, icon: Icon(Icons.bookmark))],
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 10,),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: txtsearch,
//               decoration: InputDecoration(
//                   hintText: 'Search',
//                   hintStyle: TextStyle(fontSize: 15),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   suffixIcon: Padding(
//                     padding: const EdgeInsets.only(right: 10),
//                     child: IconButton(
//                         onPressed: () {
//                           Provider.of<HomeProvider>(context, listen: false)
//                               .fetchsearchPhoto(txtsearch.text);
//                         },
//                         icon: Icon(Icons.search)),
//                   )),
//             ),
//           ),
//
//           listbox(Mheight),
//         ],
//       ),
//     );
//   }
// }