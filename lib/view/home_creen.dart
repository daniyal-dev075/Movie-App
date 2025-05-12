import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/res/app_colours.dart';
import 'package:movie_app/view_model/home_view_model.dart';
import 'package:movie_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../utils/routes/route_name.dart';
import '../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    homeViewModel.FetchMovieListApi();
    super.initState();
  }
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: AppColours.backgroundColour,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColours.buttonColour,
        title: Text('Movies'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              userPreferences.removeUser().then((value) {
                Navigator.pushNamed(context, RouteName.loginView);
              });
            },
            child: Icon(Icons.logout,),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext context) => homeViewModel,
    child: Consumer<HomeViewModel>(builder: (context,value,_){
      switch(value.movieList.status){
        case Status.LOADING:
          return Center(child: CircularProgressIndicator(color: AppColours.buttonColour,));
        case Status.ERROR:
          WidgetsBinding.instance.addPostFrameCallback((_){
            Utils.toastMessage(value.movieList.message.toString());
          });
        case Status.COMPELTED:
          return ListView.builder(
            itemCount: value.movieList.data!.movies!.length,
              itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(top:  5.0,left: 8.0,right: 8.0),
              child: Card(
                color: AppColours.lightGreenContainer,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  leading: Container(
                    width: 70.w, // Set your desired width
                    height: 100.h, // Set your desired height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), // Optional: for rounded corners
                      color: Colors.grey.shade200, // Placeholder background
                    ),
                    clipBehavior: Clip.hardEdge, // Ensures the image stays within the border radius
                    child: Image.network(
                      value.movieList.data!.movies![index].posterurl.toString(),
                      fit: BoxFit.cover, // Fills the entire container, cropping if necessary
                      errorBuilder: (context, error, stackTrace) {
                        return Center(child: Icon(Icons.error, color: Colors.red));
                      },
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(Utils.averageRating(value.movieList.data!.movies![index].ratings).toStringAsFixed(1),style: TextStyle(color: Colors.white),),
                      SizedBox(width: 3,),
                      Icon(Icons.star,color: Colors.yellow,size: 18,)
                    ],
                  ),
                  title: Text(value.movieList.data!.movies![index].title.toString(),style: TextStyle(color: Colors.white),),
                  subtitle: Text(value.movieList.data!.movies![index].year.toString(),style: TextStyle(color: Colors.white),),
                )
              ),
            );
          });
        default:
          return Text('Api did not hit');
      }
      return Container();
    }
    ),
      ));
  }
}
