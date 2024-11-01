import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPages extends StatefulWidget {
  const SearchPages({super.key});

  @override
  State<SearchPages> createState() => _SearchPagesState();
}

class _SearchPagesState extends State<SearchPages> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Search'),
      ),
    );
  }
}
