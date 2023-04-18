import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final int lenght;
  final List<String> names;
  final List<Widget> children;
  const CustomTabBar({
    super.key,
    required this.lenght,
    required this.names,
    required this.children,
  }) : assert(
          children.length == lenght,
          names.length == lenght,
        );

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.lenght, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelPadding: const EdgeInsets.all(10),
          tabs: widget.names.map((name) => Text(name)).toList(),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.children,
          ),
        ),
      ],
    );
  }
}
