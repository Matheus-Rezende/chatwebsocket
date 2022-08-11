import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    Key? key,
    required this.name,
    required this.message,
    this.direction = MessageDirection.from,
  }) : super(key: key);

  final String name;
  final String message;
  final MessageDirection direction;

  @override
  Widget build(BuildContext context) {
    return _MessageContainer(
      messageDirection: direction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
          Text(
            message,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

enum MessageDirection {
  from,
  to,
}

class _MessageContainer extends Container {
  _MessageContainer({
    required Widget child,
    required MessageDirection messageDirection,
  }) : super(
            child: child,
            decoration: messageDirection == MessageDirection.from
                ? const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 253, 2, 2),
                        Color.fromARGB(255, 253, 123, 2),
                        Color.fromARGB(255, 253, 2, 2),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  )
                : const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 2, 19, 253),
                        Color.fromARGB(255, 2, 253, 232),
                        Color.fromARGB(255, 2, 19, 253),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
            margin: messageDirection == MessageDirection.from
                ? const EdgeInsets.fromLTRB(100, 10, 10, 10)
                : const EdgeInsets.fromLTRB(10, 10, 100, 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15));
}
