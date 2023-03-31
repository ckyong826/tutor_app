import 'package:flutter/material.dart';
import 'package:tutor_app/utils/size_config.dart';

class ResourceCard extends StatelessWidget {
  final String title;
  final String smallerTitle;
  final String image;
  final Color color;

  const ResourceCard({
    super.key,
    required this.title,
    required this.smallerTitle,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return SizedBox(
      width: ScreenSize.horizontal! * 100,
      height: ScreenSize.vertical! * 42,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          width: ScreenSize.horizontal! * 85,
          height: ScreenSize.vertical! * 38,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                child: Column(
                  children: [
                    Text(
                      smallerTitle,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: ScreenSize.vertical! * 1,
                    ),
                    const TopResourceCard(
                      title: "Sejarah Last Minute Quick Notes",
                      tutor: "jinzhetan",
                      likes: 123,
                    ),
                    SizedBox(
                      height: ScreenSize.vertical! * 2,
                    ),
                    const TopResourceCard(
                      title: "Chemistry Tips and Tricks",
                      tutor: "halo_tongxue",
                      likes: 79,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 15,
          child: Image.asset(
            image,
            scale: ScreenSize.vertical! * 0.12,
          ),
        )
      ]),
    );
  }
}

class TopResourceCard extends StatelessWidget {
  final String title;
  final String tutor;
  final int likes;
  const TopResourceCard({
    super.key,
    required this.title,
    required this.tutor,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //TOP RESOURCES CONTAINER
      width: ScreenSize.horizontal! * 75,
      height: ScreenSize.vertical! * 11,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: SizedBox(
            width: ScreenSize.horizontal! * 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: (ScreenSize.vertical! * 2),
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    "by $tutor",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: (ScreenSize.vertical! * 1.8),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              const Icon(
                Icons.favorite_outline,
                size: 20,
              ),
              Text(likes.toString()),
            ],
          ),
        )
      ]),
    );
  }
}
