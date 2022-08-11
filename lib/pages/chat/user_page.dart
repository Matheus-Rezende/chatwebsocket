import 'package:flutter/material.dart';
import 'package:lesson_flutter_websocket/configuration/user_config.dart';
import 'package:lesson_flutter_websocket/pages/chat/chat_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(50),
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff027dfd), Color(0xff4100e0)])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                prefixIcon: const IconTheme(
                  data: IconThemeData(
                    color: Colors.white,
                  ),
                  child: Icon(Icons.person),
                ),
                focusColor: Colors.white,
                hintText: "Digite seu nome",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1)),
                filled: true,
                hintStyle: const TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2))),
          ),
          CircleAvatar(
            radius: 40,
            backgroundColor: const Color.fromARGB(255, 23, 7, 255),
            child: IconButton(
              icon: const Icon(Icons.send),
              iconSize: 35,
              color: Colors.white,
              onPressed: () {
                setState(() {
                  textEditingController.text == ""
                      ? UserConfig.name = "Anônimo"
                      : UserConfig.name = textEditingController.text;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatPage()),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
