import 'package:flutter/cupertino.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
          
          )
        ],
      ),
    );
  }
}
