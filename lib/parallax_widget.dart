import 'package:flutter/material.dart';

class ParallaxEffect extends StatefulWidget {
  final Widget child;

  const ParallaxEffect({super.key, required this.child});

  @override
  //_ParallaxEffectState createState() => _ParallaxEffectState();
  State<ParallaxEffect> createState() => _ParallaxEffectState();
}

class _ParallaxEffectState extends State<ParallaxEffect> {
  double _mouseX = 0;
  double _mouseY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onEnter: (e) {
          setState(() {
            _mouseX = e.localPosition.dx;
            _mouseY = e.localPosition.dy;
          });
        },
        onHover: (e) {
          setState(() {
            _mouseX = e.localPosition.dx;
            _mouseY = e.localPosition.dy;
          });
        },
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.005)
            ..rotateX((_mouseY - MediaQuery.of(context).size.height / 2) *
                0.001 *
                (_mouseY / MediaQuery.of(context).size.height))
            ..rotateY((_mouseX - MediaQuery.of(context).size.width / 2) *
                0.001 *
                (_mouseX / MediaQuery.of(context).size.width)),
          alignment: FractionalOffset.center,
          child: widget.child,
        ),
      ),
    );
  }
}
