import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_cloning/modelView/hightlightModelView.dart';
import 'package:instagram_cloning/modelView/uploadsModelView.dart';
import 'package:instagram_cloning/modelView/usermodelview.dart';
import 'package:provider/provider.dart';

class ProfiPages extends StatefulWidget {
  const ProfiPages({super.key});

  @override
  State<ProfiPages> createState() => _ProfiPagesState();
}

class _ProfiPagesState extends State<ProfiPages> {
  String name = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Usermodelview>(context, listen: false).getUserByUid();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Hightlightmodelview>(context, listen: false).fetchHighlight();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Uploadsmodelview>(context, listen: false).getUploadAndUser();
    });
  }

  int index = 0;
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Agung',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Image(
                  image: AssetImage('assets/icons/more.png'),
                  height: 30,
                )),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {},
                icon: const Image(
                  image: AssetImage('assets/icons/web.png'),
                  height: 25,
                ))
          ],
        ),
        body: ListView(
          children: [
            // profill widget di bawah
            Profil_widget(index: index, height: height, width: width),
            // hightlight widget di bawah
            Hightlight_widget(height: height),
            // tidak bisa dibuat widget
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: width / 3,
                        color: Colors.white,
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    selected = 0;
                                  });
                                },
                                icon: const Image(
                                  image:
                                      AssetImage('assets/icons/profile(1).png'),
                                  height: 30,
                                )),
                            (selected == 0)
                                ? const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Divider(
                                      thickness: 2.5,
                                      color: Colors.black,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: width / 3,
                        color: Colors.white,
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    selected = 1;
                                  });
                                },
                                icon: const Image(
                                  image: AssetImage('assets/icons/video.png'),
                                  height: 30,
                                )),
                            (selected == 1)
                                ? const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Divider(
                                      thickness: 2.5,
                                      color: Colors.black,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: width / 3,
                        color: Colors.white,
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    selected = 2;
                                  });
                                },
                                icon: const Image(
                                  image: AssetImage('assets/icons/avatar.png'),
                                  height: 30,
                                )),
                            (selected == 2)
                                ? const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Divider(
                                      thickness: 2.5,
                                      color: Colors.black,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Consumer<Uploadsmodelview>(
                        builder: (context, viewModel, child) {
                      return Wrap(
                          children: viewModel.upload.map((upload) {
                        return Padding(
                          padding: const EdgeInsets.all(1),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: height / 8,
                              width: width / 3.1,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  image: DecorationImage(
                                      image: NetworkImage(upload.url),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        );
                      }).toList());
                    }),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class Hightlight_widget extends StatelessWidget {
  const Hightlight_widget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 7,
      color: Colors.white,
      child:
          Consumer<Hightlightmodelview>(builder: (context, viewModel, child) {
        return (viewModel.highlightData.isEmpty)
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: viewModel.highlightData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        InkWell(
                            child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  viewModel.highlightData[index].url),
                            ),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(viewModel.highlightData[index].name),
                        )
                      ],
                    ),
                  );
                })
            : Container();
      }),
    );
  }
}

class Profil_widget extends StatelessWidget {
  const Profil_widget({
    super.key,
    required this.index,
    required this.height,
    required this.width,
  });

  final int index;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Consumer<Usermodelview>(builder: (context, viewModel, child) {
        return Wrap(
          children: viewModel.userData.map((user) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(user.img),
                        ),
                        const Column(
                          children: [
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'post',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        const Column(
                          children: [
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'followers',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        const Column(
                          children: [
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'following',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      viewModel.userData[index].username,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: height / 23,
                          width: width / 2.5,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: height / 23,
                          width: width / 2.5,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Shared Profile',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: height / 23,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                image: AssetImage('assets/icons/invite.png'),
                                height: 20,
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        );
      }),
    );
  }
}
