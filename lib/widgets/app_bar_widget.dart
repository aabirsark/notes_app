import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final Icon icon;
  const AppBarButton({Key key, @required this.icon, @required this.tapProcess})
      : super(key: key);

  final Function tapProcess;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: tapProcess,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
