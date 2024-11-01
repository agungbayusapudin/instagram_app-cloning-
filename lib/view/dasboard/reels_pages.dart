import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReelsPages extends StatefulWidget {
  const ReelsPages({super.key});

  @override
  State<ReelsPages> createState() => _ReelsPagesState();
}

class _ReelsPagesState extends State<ReelsPages> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('rells'),
      ),
    );
  }
}
