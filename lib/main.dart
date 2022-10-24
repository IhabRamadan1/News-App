import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Layouts/HomeLayout.dart';
import 'package:flutter_app/Layouts/cubit/NewsCubit.dart';
import 'package:flutter_app/Layouts/cubit/NewsStates.dart';
import 'package:flutter_app/network/local/cacheHelper.dart';
import 'package:flutter_app/network/remote/DioHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await cacheHelper.init();
  bool? isdark = await cacheHelper.getData(key: 'isdark');

    runApp(MyApp(isdark: isdark!));
}
class MyApp extends StatelessWidget {
  final bool isdark;

  const MyApp({required this.isdark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getBusiness()..getScience()..getSports()..changeTheme(
        dark: isdark
      ),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            home: HomeLayout(),
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              backgroundColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                color: Colors.white,
                elevation: 0.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.grey[300],
                selectedItemColor: Colors.deepOrange,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                color: HexColor('333739'),
                elevation: 0.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.grey[300],
                selectedItemColor: Colors.deepOrange,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              ),

            ),
            themeMode: NewsCubit.get(context).isdark? ThemeMode.dark: ThemeMode.light,
            debugShowCheckedModeBanner: false,
          );
        },
      )
    );
  }
}

