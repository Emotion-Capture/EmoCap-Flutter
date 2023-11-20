import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
          decoration: InputDecoration(
        hintText: '검색',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      )),
    );
  }
}
