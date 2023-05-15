// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YinFloatingActionButtonArgs {
  final double size;
  final Color scaffoldBackgroundColor;
  final int stepCount;
  final int currentStep;

  final void Function()? onTap;
  YinFloatingActionButtonArgs({
    required this.size,
    required this.scaffoldBackgroundColor,
    this.stepCount = 2,
    required this.currentStep,
    this.onTap,
  }) : assert(currentStep <= stepCount);
}

class YinFloatingActionButton extends StatefulWidget {
  final YinFloatingActionButtonArgs args;
  const YinFloatingActionButton({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<YinFloatingActionButton> createState() =>
      _YinFloatingActionButtonState();
}

class _YinFloatingActionButtonState extends State<YinFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animationController.addListener(() {
      setState(() {
        _progressValue = _animationController.value;
      });
    });
    runProgress();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void runProgress() {
    if (_progressValue == 1) {
      setState(() {
        _progressValue = 0;
      });
    }
    _animationController.animateTo(_progressValue + 1 / widget.args.stepCount,
        duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.args.onTap?.call();
        runProgress();
      },
      child: Container(
        height: widget.args.size,
        width: widget.args.size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            SizedBox(
              height: widget.args.size,
              width: widget.args.size,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
                value: _progressValue,
                backgroundColor: Colors.white.withOpacity(0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/angle_right_solid.svg",
                    height: 20,
                    width: 16,
                    color: widget.args.scaffoldBackgroundColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
