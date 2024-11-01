import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_cloning/view/dasboard/home_pages.dart';
import 'package:instagram_cloning/view/dasboard/post_pages.dart';
import 'package:instagram_cloning/view/dasboard/profi_pages.dart';
import 'package:instagram_cloning/view/dasboard/reels_pages.dart';
import 'package:instagram_cloning/view/dasboard/search_pages.dart';

class DasboardPages extends StatefulWidget {
  const DasboardPages({super.key});

  @override
  State<DasboardPages> createState() => _DasboardPagesState();
}

class _DasboardPagesState extends State<DasboardPages> {
  final List screen = [
    const HomePages(),
    const SearchPages(),
    const PostPages(),
    const ReelsPages(),
    const ProfiPages()
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: screen[index],
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 30),
          height: height / 10,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    icon: const Image(
                      image: AssetImage('assets/icons/home.png'),
                      height: 28,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    icon: const Image(
                      image: AssetImage('assets/icons/search.png'),
                      height: 28,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    icon: const Image(
                      image: AssetImage('assets/icons/more.png'),
                      height: 28,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        index = 3;
                      });
                    },
                    icon: const Image(
                      image: AssetImage('assets/icons/video.png'),
                      height: 28,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        index = 4;
                      });
                    },
                    icon: const Icon(
                      Icons.circle,
                      size: 40,
                    ))
              ],
            ),
          ),
        ));
  }
}
