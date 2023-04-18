import 'package:flutter/material.dart';

class DefaultPhysicsWithoutController extends StatelessWidget {
  const DefaultPhysicsWithoutController({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}
