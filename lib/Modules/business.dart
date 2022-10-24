
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Layouts/cubit/NewsCubit.dart';
import 'package:flutter_app/Layouts/cubit/NewsStates.dart';
import 'package:flutter_app/Shared/components/reusable_components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return  ConditionalBuilder(
          condition: state is! LoadingBusinessState,
          builder: (context)=> ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>BuildArticleItem(NewsCubit.get(context).business[index],context),
              separatorBuilder: (context,index)=>BuildSeparated(),
              itemCount: NewsCubit.get(context).business.length,
          ),
          fallback: (context)=>Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}
