import 'package:flutter/material.dart';
import 'package:tutor_app/utils/resources_components.dart';
import 'package:tutor_app/utils/size_config.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(250, 226, 223, 223),
          image: DecorationImage(
            image: AssetImage("assets/resources_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(children: [
              ResourceCard(
                title: "Notes",
                smallerTitle: "Top this week",
                image: "assets/pencil.png",
                color: Color(0xffFFDABF),
              ),
              ResourceCard(
                title: "QuestionsExchange",
                smallerTitle: "Popular this week",
                image: "assets/speaker.png",
                color: Color(0xffFF9AB2),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
