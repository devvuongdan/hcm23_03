// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  final Widget Function(BuildContext context) builder;
  const BaseScreen({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Focus(
        focusNode: focusNode,
        child: widget.builder(context),
      ),
    );
  }
}
