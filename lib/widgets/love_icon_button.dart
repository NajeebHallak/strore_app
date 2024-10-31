import 'package:flutter/material.dart';

class LoveIconeButton extends StatefulWidget {
  const LoveIconeButton({
    super.key,
  });

  @override
  State<LoveIconeButton> createState() => _LoveIconeButtonState();
}

class _LoveIconeButtonState extends State<LoveIconeButton> {
  bool isLove = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isLove = !isLove;
        });
      },
      icon: isLove
          ? const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 25,
            )
          : const Icon(
              Icons.favorite_border,
              color: Colors.black,
              size: 25,
            ),
    );
  }
}
