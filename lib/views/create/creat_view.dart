import 'package:flutter/cupertino.dart';

class CreateView extends StatefulWidget {
  const CreateView({super.key});

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: const Text("CREATE"));
  }
}
