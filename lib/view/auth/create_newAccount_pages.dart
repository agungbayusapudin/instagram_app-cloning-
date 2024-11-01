import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_cloning/view/auth/login_pages.dart';

class CreateNewaccountPages extends StatefulWidget {
  const CreateNewaccountPages({super.key});

  @override
  State<CreateNewaccountPages> createState() => _CreateNewaccountPagesState();
}

class _CreateNewaccountPagesState extends State<CreateNewaccountPages> {
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 250, 238, 236),
          Color.fromARGB(255, 234, 245, 255)
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPages()));
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 40,
                  )),
              const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  'Whats`s your mobile number?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
                child: Text(
                    'Enter the mobile number where you can be contacted no one will see this on your profile.'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Mobile number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'You may rechive WhatsApp and SMS notifications from us for security and login purposes.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 1, 65, 215),
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
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 17),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
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
                        'Sign up with email',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 17),
                      )),
                ),
              ),
              const Spacer(),
              const Center(
                child: Text(
                  'I alerdy have an account',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
