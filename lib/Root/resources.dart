import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class Resources extends StatelessWidget {
  const Resources({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Resources'),
            ElevatedButton(
            onPressed: (){
              context.go('/resources/categories');
            }, 
            child: const Text('Resources')
            ),
            ElevatedButton(
            onPressed: (){
              context.go('/resources/forum');
            }, 
            child: const Text('Forum')
            )
          ],
        ),
      ),
    );
  }
}