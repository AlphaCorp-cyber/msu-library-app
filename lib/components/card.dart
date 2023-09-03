// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  child: Image.asset(
                    "https://images.unsplash.com/photo-1593642532400-2682810df593?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
                    fit: BoxFit.fill,
                    colorBlendMode: BlendMode.color,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: const Icon(
                        Icons.message_sharp,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
