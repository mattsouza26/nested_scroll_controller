import 'package:flutter/material.dart';

import 'tab_bar/custom_physics_with_controller.dart';
import 'tab_bar/default_physics.dart';
import 'tab_bar/default_physics_with_controller.dart';
import 'widgets/custom_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _nestedController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
        centerTitle: true,
      ),
      body: NestedScrollView(
        controller: _nestedController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              height: 150,
              width: 100,
            ),
          )
        ],
        body: CustomTabBar(
          lenght: 3,
          names: const [
            "Default Physics",
            "Default Physics with Controller",
            "Custom Physics with Controller",
          ],
          children: [
            const DefaultPhysics(),
            const DefaultPhysicsWithController(),
            CustomPhysicsWithController(controller: _nestedController),
          ],
        ),
      ),
    );
  }
}
