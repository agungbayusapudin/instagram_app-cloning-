import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_cloning/model/storyModel.dart';
import 'package:instagram_cloning/modelView/storyModelView.dart';
import 'package:instagram_cloning/modelView/uploadsModelView.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  // memanggil get story dari Storyviewmodel
  @override
  void initState() {
    super.initState();
    // Memanggil getStory hanya sekali setelah widget diinisialisasi
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Storymodelview>(context, listen: false).getStory();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Uploadsmodelview>(context, listen: false).getUpload();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: const [_headerWidget(), _storyWidget(), _postWidget()],
      ),
    ));
  }
}

class _postWidget extends StatelessWidget {
  const _postWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Consumer<Uploadsmodelview>(builder: (context, viewModel, child) {
          if (viewModel.upload.isEmpty) {
            return const Center(child: Text("No data available"));
          }

          final random = Random();
          int randomIndex = random.nextInt(viewModel.upload.length);

          return Wrap(
              children: viewModel.upload.map((upload) {
            Timestamp timestamp = upload.tanggal;

            DateTime dateTime = timestamp.toDate();

            String formattedDate = DateFormat('d MMMM yyyy').format(dateTime);
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              upload.user,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Image(
                              image: AssetImage('assets/icons/more(1).png'),
                              height: 20,
                            ))
                      ],
                    ),
                  ),
                  Image(
                    image: NetworkImage(upload.url),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Image(
                              image: AssetImage('assets/icons/heart.png'),
                              height: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Image(
                              image: AssetImage('assets/icons/chat(1).png'),
                              height: 35,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Image(
                              image: AssetImage('assets/icons/send.png'),
                              height: 30,
                            )),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Image(
                              image: AssetImage(
                                  'assets/icons/save-instagram(1).png'),
                              height: 30,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Text.rich(TextSpan(children: [
                        const TextSpan(
                            text: 'Agung ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: upload.coments)
                      ]))),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      formattedDate,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            );
          }).toList());
        }));
  }
}

class _storyWidget extends StatelessWidget {
  const _storyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Consumer<Storymodelview>(builder: (context, viewModel, child) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.story.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(viewModel.story[index].url),
                            ),
                            const Text('Your Story')
                          ],
                        ),
                        const Positioned(
                            top: 60,
                            left: 60,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image(
                                image: AssetImage('assets/icons/add.png'),
                                height: 30,
                              ),
                            )),
                      ],
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}

class _headerWidget extends StatelessWidget {
  const _headerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            const Image(
              image: AssetImage('assets/logo/instagram.png'),
              height: 70,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Image(
                  image: AssetImage('assets/icons/heart.png'),
                  height: 30,
                )),
            const SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {},
                icon: const Image(
                  image: AssetImage('assets/icons/chat.png'),
                  height: 30,
                ))
          ],
        ),
      ),
    );
  }
}
