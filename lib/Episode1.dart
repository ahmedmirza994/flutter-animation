import 'package:flutter/material.dart';

class Episode1 extends StatefulWidget {
  @override
  _Episode1State createState() => _Episode1State();
}

class _Episode1State extends State<Episode1> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> _curvedAnimation;


  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);

    _curvedAnimation.addStatusListener((status){
      if(status == AnimationStatus.completed) {
        _controller.reverse();
      } else if(status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: _curvedAnimation,);
  }
}


class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation animation})
      : super(key: key, listenable: animation);

  final Tween<double> _sizeAnimation = Tween<double>(begin: 0.0, end: 30.0);

  @override
  Widget build(BuildContext context) {
    final Animation<double> _animation = listenable;
    return Transform.scale(
      scale: _animation.value * 30,
      child: FlutterLogo(),
    );
  }

// @override
// Widget build(BuildContext context) {
//   final Animation<double> _animation = listenable;
//   return Transform.scale(
//     scale: _sizeAnimation.evaluate(_animation),
//     child: FlutterLogo(),
//   );
// }
}
