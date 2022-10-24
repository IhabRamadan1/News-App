
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Layouts/cubit/NewsCubit.dart';
import '../Layouts/cubit/NewsStates.dart';
import '../Shared/components/reusable_components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return  ConditionalBuilder(
          condition: state is! LoadingsportsState,
          builder: (context)=> ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>BuildArticleItem(NewsCubit.get(context).sports[index],context),
            separatorBuilder: (context,index)=>BuildSeparated(),
            itemCount: NewsCubit.get(context).sports.length,
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}
