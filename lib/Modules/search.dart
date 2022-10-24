import 'package:flutter/material.dart';
import 'package:flutter_app/Layouts/cubit/NewsCubit.dart';
import 'package:flutter_app/Layouts/cubit/NewsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Shared/components/reusable_components.dart';

class SearchScreen extends StatelessWidget {

  var SearchContoller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: SearchContoller,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return "Search mustn't be empty";
                      }
                      return null;
                    },
                    onChanged: (value){
                      NewsCubit.get(context).getSearch(value);
                    },

                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index)=>BuildArticleItem(NewsCubit.get(context).search[index],context),
                    separatorBuilder: (context,index)=>BuildSeparated(),
                    itemCount: NewsCubit.get(context).search.length,
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}
