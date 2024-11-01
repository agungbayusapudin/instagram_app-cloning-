import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_cloning/model/userLoginModel.dart';
import 'package:instagram_cloning/modelView/loginModelView.dart';
import 'package:instagram_cloning/view/auth/create_newAccount_pages.dart';
import 'package:instagram_cloning/view/dasboard/dasboard_pages.dart';
import 'package:provider/provider.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 250, 238, 236),
            Color.fromARGB(255, 234, 245, 255)
          ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
          child: Consumer<Loginmodelview>(builder: (context, viewModel, child) {
            return Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 6, bottom: height / 20),
                    child: Image(
                      image: const AssetImage('assets/logo/instagram_logo.png'),
                      height: height / 12,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          labelText: 'username',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 1, 65, 215),
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton(
                          onPressed: () async {
                            await viewModel.login(
                                _usernameController.text.trim(),
                                _passwordController.text.trim());

                            print(viewModel.errorMessage);

                            if (viewModel.errorMessage != null &&
                                viewModel.errorMessage!.isNotEmpty) {
                              // Show error message

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(viewModel.errorMessage!)),
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DasboardPages()),
                              );
                            }
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          )),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.black),
                      )),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateNewaccountPages()));
                          },
                          child: const Text(
                            'Create new account',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.normal,
                                fontSize: 17),
                          )),
                    ),
                  ),
                  // const Image(image: AssetImage('assets/logo/meta_logo.png'))
                  Container(
                    height: height / 30,
                    width: width / 5,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/logo/meta_logo.png'),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            );
          })),
    );
  }
}
