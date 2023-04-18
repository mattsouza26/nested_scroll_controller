import 'package:flutter/material.dart';

class DefaultPhysicsWithController extends StatefulWidget {
  const DefaultPhysicsWithController({super.key});

  @override
  State<DefaultPhysicsWithController> createState() => _DefaultPhysicsWithControllerState();
}

class _DefaultPhysicsWithControllerState extends State<DefaultPhysicsWithController> {
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
      itemBuilder: (context, index) => ListTile(
        title: Text("item $index"),
      ),
      itemCount: 50,
    );
  }
}
