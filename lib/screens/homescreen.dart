import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/AlbumModel.dart';
import '../models/CommentModel.dart';

import '../models/PhotoModel.dart';
import '../models/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
/////////////////////// User Data ////////////////
class _HomeScreenState extends State<HomeScreen> {
  var data ;

  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {



    }
  }

  ///////////////////////Photos//////////////
  //
  // List<PhotoModel> photos = [];
  //
  // Future<List<PhotoModel>> getPhotos() async {
  //   final response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body.toString());
  //     for (Map i in data) {
  //       photos.add(PhotoModel.fromJson(i));
  //     }
  //     return photos;
  //   } else {
  //     return photos;
  //   }
  // }

//////////Albums//////////////////

// List<AlbumModel> albumData = [];
// Future<List<AlbumModel>> getAlbums() async{
// final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
//
// if(response.statusCode ==200){
//   var data = jsonDecode(response.body.toString());
//   for(Map i in data){
//     albumData.add(AlbumModel.fromJson(i));
//
//   }
//   return albumData;
// }else{
//   return albumData;
// }
//
//
// }

  ///////////////////////////Comments///////////////////////////

  // List<CommentModel> commentList = [];
  //
  // Future<List<CommentModel>> getCmntApi() async{
  //
  //
  //   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
  //   if(response.statusCode == 200){
  //     var data = jsonDecode(response.body.toString());
  //     for(Map i in data){
  //       commentList.add(CommentModel.fromJson(i));
  //
  //
  //     }
  //     return commentList;
  //   }
  //   else{
  //
  //     return commentList;
  //
  //   }
  //
  //
  //
  // }
  //

////////////////////////// Posts //////////////////////////////
//
//   List<PostModel> postList = [];
//
//   Future<List<PostModel>> getPostApi() async {
//     final response =
//     await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
//
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body.toString());
//       for (Map i in data) {
//         postList.add(PostModel.fromJson(i));
//       }
//       return postList;
//     } else {
//       return postList;
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("API Integeration")),
        ),
        body: FutureBuilder(
            future: getUserApi(),
            builder: (context , snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator()
            );

          }else{

            return ListView.builder(
                  itemCount: data.length,

                  itemBuilder: (context,index){
                return Card(
                  child:  Column(children: [

                  Reusable(title: 'Name:', value: data[index]['name'].toString()),
                    Reusable(title: 'Username:', value: data[index]['username'].toString()),
                    Reusable(title: 'Email:', value: data[index]['email'].toString()),
                    Reusable(title: 'Address', value: '--------------------------------------------'),
                    Reusable(title: 'Street:', value: data[index]['address']['street'].toString()),
                    Reusable(title: 'Suite:', value: data[index]['address']['suite'].toString()),
                    Reusable(title: 'City:', value: data[index]['address']['city'].toString()),
                    Reusable(title: 'Zip Code:', value: data[index]['address']['zipcode'].toString()),
                    Reusable(title: 'GEO', value: '--------------------------------------------'),
                    Reusable(title: 'Latitude', value: data[index]['address']['geo']['lat'].toString()),
                    Reusable(title: 'Longitude', value: data[index]['address']['geo']['lng'].toString()),

                  ],),

                );

              });


          }


        }));
  }
}


class Reusable extends StatelessWidget {
  String value, title , heading;
  Reusable({Key? key , required this.title, required this.value, this.heading = '' }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,),
          Text(value),
        ],
      ),
    );
  }
}
