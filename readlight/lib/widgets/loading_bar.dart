import 'package:flutter/material.dart';
import '../controllers/loading_controller.dart';
import '../states/loading_state.dart';

class LoadingBar extends StatefulWidget {
  final LoadingState state;
  final VoidCallback? onLoadingComplete;

  const LoadingBar({
    super.key,
    required this.state,
    this.onLoadingComplete,
  });

  @override
  LoadingBarState createState() => LoadingBarState();
}

class LoadingBarState extends State<LoadingBar>
    with SingleTickerProviderStateMixin {
  late LoadingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LoadingController();
    _controller.initializeAnimation(
        this,
        widget.state.animationDuration,
        widget.onLoadingComplete
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.state.width,
      height: widget.state.height,
      decoration: BoxDecoration(
        color: widget.state.backgroundColor,
        borderRadius: BorderRadius.circular(widget.state.height / 2),
      ),
      child: AnimatedBuilder(
        animation: _controller.animation,
        builder: (context, child) {
          return FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: _controller.animation.value,
            child: Container(
              decoration: BoxDecoration(
                color: widget.state.progressColor,
                borderRadius: BorderRadius.circular(widget.state.height / 2),
              ),
            ),
          );
        },
      ),
    );
  }
}
