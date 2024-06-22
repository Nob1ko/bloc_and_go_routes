import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithNavigationBar(
      body: navigationShell,
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _goBranch,
    );
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: NavigationBar(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              return Colors.amber[50]; // Default color
            },
          ),
          indicatorColor: Colors.transparent,
          backgroundColor: Colors.amber[50],
          selectedIndex: selectedIndex,
          destinations: [
            NavigationDestination(
                label: 'Section A',
                icon: Icon(selectedIndex == 0
                    ? Icons.discord
                    : Icons.discord_outlined)),
            NavigationDestination(
                label: 'Search',
                icon:
                    Icon(selectedIndex == 1 ? Icons.search : Icons.search_off)),
            NavigationDestination(
                label: 'Section B',
                icon: Icon(selectedIndex == 2
                    ? Icons.create
                    : Icons.create_new_folder)),
            NavigationDestination(
                label: 'Section B',
                icon: Icon(selectedIndex == 3
                    ? Icons.inbox
                    : Icons.incomplete_circle_rounded)),
            NavigationDestination(
                label: 'Section B',
                icon: Icon(selectedIndex == 4
                    ? Icons.settings
                    : Icons.settings_accessibility)),
          ],
          onDestinationSelected: onDestinationSelected,
        ),
      ),
    );
  }
}
