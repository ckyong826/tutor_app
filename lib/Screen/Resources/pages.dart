import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

import '../../tools/SizeConfig.dart';

class Pages extends StatelessWidget {
  const Pages({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //the video image
            Container(
              height: SizeConfig.safeBlockVertical! * 35,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: AssetImage('assets/image/download.jpeg'),
                    fit: BoxFit.cover
                  ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.safeBlockVertical! * 2.5),
                  CircleAvatar(
                    backgroundColor: Color(0XFFE6E7F2),
                    radius: SizeConfig.blockSizeHorizontal! * 7,
                    child: IconButton(
                      onPressed: (){
                        context.pop();
                      }, 
                      icon: Icon(Icons.arrow_back,),
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding:  EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.safeBlockVertical! * 1.5),
                  Text(
                    'Law of Thermodynamic',
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal! * 7.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Posted by Nipuhawanj',
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal! * 4,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF666666),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 2),
                  Text(
                    '1 hour 15 mins | Chemistry ',
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal! * 4,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF333333),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 2),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus porta augue nec nulla ',
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal! * 4,
                      fontWeight: FontWeight.normal,
                      color: Color(0XFF444444),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 3),
                  Row(
                    children: [
                      Icon(Icons.favorite, size: SizeConfig.safeBlockVertical! * 4, color: Colors.red[700],),
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 3),
                      Text(
                        "160 Likes", 
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal! * 4,
                        ),
                      ),
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 15),
                      Icon(Icons.download, size: SizeConfig.safeBlockVertical! * 4),
                      SizedBox(width: SizeConfig.blockSizeHorizontal! * 3),
                      Text(
                        "200 Downloaded", 
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal! * 4,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 1),
                  Divider(
                    thickness: SizeConfig.safeBlockVertical! * 0.15,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    floatingActionButton: Container(
      width: SizeConfig.blockSizeHorizontal! * 60,
      child: FloatingActionButton.extended(
        onPressed: (){
        },
        label: Text('Play'),
        backgroundColor: Color(0XFF9F9DF3),
        ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  );
  }
}