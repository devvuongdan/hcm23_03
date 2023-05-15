// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class YinOnboardFloattingActionButton extends StatefulWidget {
  final double startValue;
  final double endValue;
  const YinOnboardFloattingActionButton({
    Key? key,
    required this.startValue,
    required this.endValue,
  }) : super(key: key);

  @override
  State<YinOnboardFloattingActionButton> createState() =>
      _YinOnboardFloattingActionButtonState();
}

class _YinOnboardFloattingActionButtonState
    extends State<YinOnboardFloattingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isButtonPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.linear),
    ));

    _controller.addListener(() {
      setState(() {}); // Khi giá trị hoạt hình thay đổi, cập nhật lại giao diện
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _isButtonPressed = true;
    _controller.reset();
    _controller.forward().whenComplete(() {
      if (_isButtonPressed) {
        _animation =
            Tween<double>(begin: 0.5, end: 1.0).animate(CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.5, 1.0, curve: Curves.linear),
        ));
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startAnimation,
      child: Container(
        height: 58,
        width: 58,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            CircularProgressIndicator(
              value: _animation.value,
              color: const Color(0xFFFFFFFF),
            )
          ],
        ),
      ),
    );
  }
}
