import 'package:flutter/material.dart';
import 'package:flut/constants.dart';
import 'package:intl/intl.dart'; // Import for formatting timestamps

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  // List to store community messages
  final List<Message> _messages = [];
  final TextEditingController _controller = TextEditingController();

  // Function to add a new message
  void _addMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(Message(
          text: _controller.text,
          timestamp: DateTime.now(),
          likes: 0,
        ));
        _controller.clear(); // Clear the input field after submission
      });
    }
  }

  // Function to like a message
  void _likeMessage(int index) {
    setState(() {
      _messages[index].likes++;
    });
  }

  // Function to delete a message
  void _deleteMessage(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this post?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _messages.removeAt(index); // Remove the message
                });
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        backgroundColor: Constants.primaryColor,
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(message.text[0].toUpperCase()), // User avatar based on the first letter of the message
                    ),
                    title: Text(message.text),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('hh:mm a, MMM d').format(message.timestamp),
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.thumb_up, size: 18),
                              onPressed: () => _likeMessage(index),
                            ),
                            Text('${message.likes} Likes'),
                            const Spacer(),
                            IconButton(
                              icon: Icon(Icons.delete, size: 18, color: Colors.red),
                              onPressed: () => _deleteMessage(index),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Input field and submit button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Share your thoughts...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: _addMessage,
                  child: const Text('Post'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Message class to represent a community message
class Message {
  final String text;
  final DateTime timestamp;
  int likes;

  Message({
    required this.text,
    required this.timestamp,
    this.likes = 0,
  });
}
