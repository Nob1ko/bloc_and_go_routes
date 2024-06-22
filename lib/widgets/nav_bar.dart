import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app_bloc/routes/routes.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.amber[100],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(context, Icons.explore, 'Discover', '/discover',
              selectedIndex == 0),
          _buildNavItem(
              context, Icons.search, 'Search', '/search', selectedIndex == 1),
          _buildNavItem(context, Icons.add_circle_outline, 'Create', '/create',
              selectedIndex == 2),
          _buildNavItem(
              context, Icons.message, 'Inbox', '/inbox', selectedIndex == 3),
          _buildNavItem(context, Icons.menu_book, 'Recipes', '/recipes',
              selectedIndex == 4),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label,
      String route, bool isSelected) {
    Color color = isSelected ? Theme.of(context).primaryColor : Colors.grey;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          context.go(route);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          Text(
            label,
            style: TextStyle(color: color, fontSize: 12),
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(Routes.DISCOVER)) return 0;
    if (location.startsWith(Routes.SEARCH)) return 1;
    if (location.startsWith(Routes.CREATE)) return 2;
    if (location.startsWith(Routes.INBOX)) return 3;
    if (location.startsWith(Routes.RECIPES)) return 4;
    return 0;
  }
}
