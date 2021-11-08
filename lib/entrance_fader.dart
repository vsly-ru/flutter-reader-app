/// Created with ❤️ by Marcin Szałek
/// https://fidev.io
/// Use it as you want :)

import 'package:flutter/material.dart';

class EntranceFader extends StatefulWidget {
  /// Child to be animated on entrance
  final Widget? child;

  /// if this whole animation should be disabled
  final bool disabled;

  /// Delay after which the animation will start
  final Duration delay;

  /// Duration of entrance animation
  final Duration duration;

  /// Starting point from which the widget will fade to its default position
  final Offset offset;

  const EntranceFader(
      {Key? key,
      this.child,
      this.delay = const Duration(milliseconds: 0),
      this.duration = const Duration(milliseconds: 400),
      this.offset = const Offset(0.0, 32.0),
      this.disabled = false})
      : super(key: key);

  @override
  EntranceFaderState createState() {
    return EntranceFaderState();
  }
}

class EntranceFaderState extends State<EntranceFader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _dxAnimation;
  late Animation _dyAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _dxAnimation =
        Tween(begin: widget.offset.dx, end: 0.0).animate(_controller);
    _dyAnimation =
        Tween(begin: widget.offset.dy, end: 0.0).animate(_controller);
    Future.delayed(widget.delay, () {
      if (this.mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.disabled
        ? widget.child ?? Container()
        : AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Opacity(
              opacity: _controller.value,
              child: Transform(
                transform: Matrix4.identity()
                  ..translate(_dxAnimation.value, _dyAnimation.value),
                // ..setRotationZ(_dxAnimation.value / 25),
                child: widget.child,
              ),
            ),
          );
  }
}
