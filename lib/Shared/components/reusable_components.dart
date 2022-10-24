import 'package:flutter/material.dart';
import 'package:flutter_app/Modules/webView.dart';
import 'package:page_transition/page_transition.dart';

Widget BuildSeparated()=>Padding(
  padding: const EdgeInsets.all(20.0),
  child:   Container(

    width: double.infinity,

    height: 1,

    color: Colors.grey[300],

  ),
);
Widget BuildArticleItem(Model,context)=>InkWell(
  onTap: (){
    Navigator.push(context, PageTransition(child: WebViewScreen(url: Model['url']),
        type: PageTransitionType.fade));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),

            image: DecorationImage(

              image: NetworkImage('${Model['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(width: 20,),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(

                  child: Text(

                    '${Model['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text(

                  "${Model['publishedAt']}",

                  style: TextStyle(

                    color: Colors.grey,

                  ),

                )



              ],

            ),

          ),

        ),

      ],

    ),

  ),
);
