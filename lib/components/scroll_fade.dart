import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollFadeIn extends StatefulWidget {
  final Widget child;
  const ScrollFadeIn({required this.child});

  @override
  State<ScrollFadeIn> createState() => ScrollFadeInState();
}

class ScrollFadeInState extends State<ScrollFadeIn>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;
  late Animation<double> _fade;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fade = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.1 && !_visible) {
      _visible = true;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: _onVisibilityChanged,
      child: SlideTransition(
        position: _slide,
        child: FadeTransition(opacity: _fade, child: widget.child),
      ),
    );
  }
}
