
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Layouts/cubit/NewsStates.dart';
import 'package:flutter_app/Modules/business.dart';
import 'package:flutter_app/Modules/science.dart';
import 'package:flutter_app/Modules/sports.dart';
import 'package:flutter_app/network/local/cacheHelper.dart';
import 'package:flutter_app/network/remote/DioHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(initialSate());

  static NewsCubit get(context)=>BlocProvider.of(context);

 List<Widget> screens=[
   BusinessScreen(),
   ScienceScreen(),
   SportsScreen(),
 ];
 int currentIndex =0;
 void BottomChange(index)
 {
   currentIndex = index;
   emit(BottomNavState());
 }

 bool isdark = false;
 void changeTheme({ bool? dark})
 {
   if(dark != null)
     {
       isdark = dark;
     }
   else isdark = !isdark;
     cacheHelper.putData(key: 'isdark', value: isdark).then((value) {
       emit(ThemeState());
     });
 }

 List<dynamic> business =[];
 void getBusiness()
 {
   emit(LoadingBusinessState());
   DioHelper.getData(
       path: 'v2/top-headlines',
       query:
       {
         'country':'eg',
         'category': 'business',
         'apiKey':'ff3d0982ec8746bbb3b3dd91cbaac64d'
       }
       ).then((value){
         business =value.data['articles'];
         emit(successBusinessState());
   }).catchError((onError){
     print("error ${onError}");
     emit(errorBusinessState());
   });
 }


 List<dynamic> science =[];
 void getScience(){
   emit(LoadingScienceState());
   DioHelper.getData(
       path: 'v2/top-headlines',
       query:
       {
         'country':'eg',
         'category': 'science',
         'apiKey':'ff3d0982ec8746bbb3b3dd91cbaac64d'
       }
   ).then((value){
     science =value.data['articles'];
     emit(successScienceState());
   }).catchError((onError){
     print("error ${onError}");
     emit(errorScienceState());
   });
 }


 List<dynamic> sports =[];
  void getSports()
 {
   emit(LoadingsportsState());
   DioHelper.getData(
       path: 'v2/top-headlines',
       query:
       {
         'country':'eg',
         'category': 'sports',
         'apiKey':'ff3d0982ec8746bbb3b3dd91cbaac64d'
       }
   ).then((value){
     sports =value.data['articles'];
     emit(successsportsState());
   }).catchError((onError){
     print("error ${onError}");
     emit(errorsportsState());
   });
 }

  List<dynamic> search =[];
  void getSearch(String value)
  {
    emit(LoadingSearchState());
    DioHelper.getData(
        path: 'v2/top-headlines',
        query:
        {
          'q':'$value',
          'apiKey':'ff3d0982ec8746bbb3b3dd91cbaac64d'
        }
    ).then((value){
      search =value.data['articles'];
      emit(successSearchState());
    }).catchError((onError){
      print("error ${onError}");
      emit(errorSearchState());
    });
  }

}