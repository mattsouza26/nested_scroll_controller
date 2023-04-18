import 'package:flutter/material.dart';
import 'package:project_test/app/common/nested_scroll_controller_physics.dart';

class CustomPhysicsWithController extends StatefulWidget {
  final ScrollController controller;
  const CustomPhysicsWithController({super.key, required this.controller});

  @override
  State<CustomPhysicsWithController> createState() => _CustomPhysicsWithControllerState();
}

class _CustomPhysicsWithControllerState extends State<CustomPhysicsWithController> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: 50,
      physics: NestedScrollControllerPhysics(parentController: widget.controller),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}
