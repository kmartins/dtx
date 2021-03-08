import 'package:flutter/material.dart';
import 'package:flutter_context_dtx/flutter_context_dtx.dart';

class FocusScopePage extends StatelessWidget {
  const FocusScopePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: context.focusScope.unfocus,
      excludeFromSemantics: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Focus'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Click away from me...',
                hintStyle: context.subtitle1TextStyle?.copyWith(
                  color: context.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
