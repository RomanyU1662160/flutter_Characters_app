import 'package:flutter/material.dart';
import 'package:flutter_rpg/theme.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    super.key,
    required this.child,
    required this.handleOnPress,
  });

  final Widget child;
  final void Function() handleOnPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.primaryAccent],
            // begin: Alignment.topCenter,
            // end: Alignment.bottomCenter,
            transform: const GradientRotation(9),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextButton(
        onPressed: handleOnPress,
        // style: FilledButton.styleFrom(backgroundColor: Colors.redAccent[200]),
        child: child,
      ),
    );
  }
}
