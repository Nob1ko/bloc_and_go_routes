import 'package:flutter/material.dart';
import 'package:template_app_bloc/widgets/nav_bar.dart';

class MainWrapper extends StatelessWidget {
  final Widget child;
  const MainWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
