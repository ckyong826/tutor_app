import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'SizeConfig.dart';

class ResourcesCard extends StatelessWidget {
  final String title;
  final String tutor;
  final int likes;
  final int downloads;
  final String subjects;

  const ResourcesCard(
      {super.key,
      required this.title,
      required this.tutor,
      required this.likes,
      required this.downloads,
      required this.subjects});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Container(
          width: 340,
          height: 110,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: InkWell(
            onTap: (){
              context.go('/resources/categories/notes/$subjects/pages');
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 3, 0, 0),
                  child: Text(
                    "by $tutor",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.favorite, size: 15),
                          Text("${likes} Likes")
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.download, size: 20),
                          Text("${downloads} downloads"),
                        ],
                      )
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
        SizedBox(height: SizeConfig.safeBlockVertical! * 2.5,)
      ],
    );
  }
}