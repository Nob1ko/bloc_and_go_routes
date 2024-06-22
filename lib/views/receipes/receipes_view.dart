import 'package:flutter/cupertino.dart';
import 'package:template_app_bloc/widgets/main_wrapper.dart';

class ReceipesView extends StatefulWidget {
  const ReceipesView({super.key});

  @override
  State<ReceipesView> createState() => _ReceipesViewState();
}

class _ReceipesViewState extends State<ReceipesView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('RECIPES'),
      ),
    );
  }
}
