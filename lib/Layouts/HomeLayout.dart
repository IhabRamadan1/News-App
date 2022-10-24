import 'package:flutter/material.dart';
import 'package:flutter_app/Layouts/cubit/NewsCubit.dart';
import 'package:flutter_app/Layouts/cubit/NewsStates.dart';
import 'package:flutter_app/Modules/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.push(context, PageTransition(
                        child: SearchScreen(),
                        type: PageTransitionType.fade
                    ));
                  },
                  icon: Icon(Icons.search),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(onPressed: (){
                  NewsCubit.get(context).changeTheme();
                },
                    icon: Icon(Icons.dark_mode)
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.currentIndex,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.business),
                    label: "Business",
                  ),
                  BottomNavigationBarItem(icon: Icon(Icons.science),
                    label: "Science",
                  ),
                  BottomNavigationBarItem(icon: Icon(Icons.sports),
                    label: "Sports",
                  ),
                ],
                onTap: (index){
                  cubit.BottomChange(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
