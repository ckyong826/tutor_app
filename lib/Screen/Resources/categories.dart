
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import '../../tools/SizeConfig.dart';

class Categories extends StatefulWidget {
   const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String subjects = " ";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                SizedBox(height: SizeConfig.safeBlockVertical! * 1),
                Text(
                  'Resources',
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal! * 7.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 3.5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Card(
                        elevation: 5,
                        color: const Color(0xFFEAE4FF),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: InkWell(   
                          onTap: (){
                            setState(() {
                              subjects = "maths";
                            });
                            context.go('/resources/categories/notes/$subjects');
                          },
                          child: SizedBox(
                            width: SizeConfig.safeBlockHorizontal! * 32.8,
                            height: SizeConfig.safeBlockVertical! * 16,
                            child: Center(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: SizeConfig.safeBlockVertical! * 3.5),
                                  Image.asset(
                                    'assets/icons/calculator.png',
                                    height: SizeConfig.safeBlockVertical! * 6.5,
                                    width: SizeConfig.safeBlockHorizontal! * 14,
                                  ),
                                  SizedBox(height: SizeConfig.safeBlockVertical! * 1.5),
                                  Text(
                                    'Math',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                    ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        color: Color(0xFFFFECDF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: InkWell(   
                          onTap: (){
                            setState(() {
                              subjects = "chemistry";
                            });
                            context.go('/resources/categories/notes/$subjects');
                          },
                          child: SizedBox(
                           width: SizeConfig.safeBlockHorizontal! * 32.8,
                           height: SizeConfig.safeBlockVertical! * 16,
                            child: Center(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: size.height * 0.032),
                                  Image.asset(
                                    'assets/icons/atom.png',
                                    height: SizeConfig.safeBlockVertical! * 6.5,
                                    width: SizeConfig.safeBlockHorizontal! * 14,
                                  ),
                                  SizedBox(height: SizeConfig.safeBlockVertical! * 1.5),
                                  Text(
                                    'Chemistry',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                    ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 2.8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Card(
                        elevation: 5,
                        color: Color(0xFFFFC2D0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: InkWell(   
                          onTap: (){
                            setState(() {
                              subjects = "physic";
                            });
                            context.go('/resources/categories/notes/$subjects');
                          },
                          child: SizedBox(
                            width: SizeConfig.safeBlockHorizontal! * 32.8,
                            height: SizeConfig.safeBlockVertical! * 16,
                            child: Center(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: size.height * 0.032),
                                  Image.asset(
                                    'assets/icons/physics.png',
                                    height: SizeConfig.safeBlockVertical! * 6.5,
                                    width: SizeConfig.safeBlockHorizontal! * 14,
                                  ),
                                  SizedBox(height: SizeConfig.safeBlockVertical! * 1.5),
                                  Text(
                                    'Physic',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                    ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        color: Color(0xFFFDFBE5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: InkWell(   
                          onTap: (){
                            setState(() {
                              subjects = "add maths";
                            });
                            context.go('/resources/categories/notes/$subjects');
                          },
                          child: SizedBox(
                            width: SizeConfig.safeBlockHorizontal! * 32.8,
                            height: SizeConfig.safeBlockVertical! * 16,
                            child: Center(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: size.height * 0.032),
                                  Image.asset(
                                    'assets/icons/calculating.png',
                                    height: SizeConfig.safeBlockVertical! * 6.5,
                                    width: SizeConfig.safeBlockHorizontal! * 14,
                                  ),
                                  SizedBox(height: SizeConfig.safeBlockVertical! * 1.5),
                                  Text(
                                    'Add Math',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                    ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 2.8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Card(
                        elevation: 5,
                        color: Color(0xFFDCFDDF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: InkWell(   
                          onTap: (){
                            setState(() {
                              subjects = "biology";
                            });
                            context.go('/resources/categories/notes/$subjects');
                          },
                          child: SizedBox(
                            width: SizeConfig.safeBlockHorizontal! * 32.8,
                            height: SizeConfig.safeBlockVertical! * 16,
                            child: Center(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: size.height * 0.032),
                                  Image.asset(
                                    'assets/icons/biology.png',
                                    height: SizeConfig.safeBlockVertical! * 6.5,
                                    width: SizeConfig.safeBlockHorizontal! * 14,
                                  ),
                                  SizedBox(height: SizeConfig.safeBlockVertical! * 1.5),
                                  Text(
                                    'Biology',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                    ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        color: Color(0xFFDFEAFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: InkWell(   
                          onTap: (){
                            setState(() {
                              subjects = "history";
                            });
                            context.go('/resources/categories/notes/$subjects');
                          },
                          child: SizedBox(
                            width: SizeConfig.safeBlockHorizontal! * 32.8,
                            height: SizeConfig.safeBlockVertical! * 16,
                            child: Center(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: size.height * 0.032),
                                  Image.asset(
                                    'assets/icons/history-book.png',
                                    height: SizeConfig.safeBlockVertical! * 6.5,
                                    width: SizeConfig.safeBlockHorizontal! * 14,
                                  ),
                                  SizedBox(height: SizeConfig.safeBlockVertical! * 1.5),
                                  Text(
                                    'History',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                    ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],),
                  SizedBox(height: SizeConfig.safeBlockVertical! * 2.8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Card(
                        elevation: 5,
                        color: Color(0xFFF8DFF3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: InkWell(   
                          onTap: (){
                            setState(() {
                              subjects = "music";
                            });
                            context.go('/resources/categories/notes/$subjects');
                          },
                          child: SizedBox(
                            width: SizeConfig.safeBlockHorizontal! * 32.8,
                            height: SizeConfig.safeBlockVertical! * 16,
                            child: Center(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: size.height * 0.032),
                                  Image.asset(
                                    'assets/icons/music-note.png',
                                    height: SizeConfig.safeBlockVertical! * 6.5,
                                    width: SizeConfig.safeBlockHorizontal! * 14,
                                  ),
                                  SizedBox(height: SizeConfig.safeBlockVertical! * 1.5),
                                  Text(
                                    'Music',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                    ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        color: Color(0xFFDDF4FB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: InkWell(   
                          onTap: (){
                            setState(() {
                              subjects = "art";
                            });
                            context.go('/resources/categories/notes/$subjects');
                          },
                          child: SizedBox(
                            width: SizeConfig.safeBlockHorizontal! * 32.8,
                            height: SizeConfig.safeBlockVertical! * 16,
                            child: Center(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: size.height * 0.032),
                                  Image.asset(
                                    'assets/icons/creativity.png',
                                    height: SizeConfig.safeBlockVertical! * 6.5,
                                    width: SizeConfig.safeBlockHorizontal! * 14,
                                  ),
                                  SizedBox(height: SizeConfig.safeBlockVertical! * 1.5),
                                  Text(
                                    'Art',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                    ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],),
                  
              ],
            ),
          )
        ],
      ),
    );
  }
}