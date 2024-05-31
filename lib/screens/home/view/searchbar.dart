import 'package:FaunaRojaCu/components/constant.dart';
import 'package:flutter/material.dart';

class SearchBarApp extends StatelessWidget {
  const SearchBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: primaryColor),
      child: const TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: InputBorder.none,
          hintText: 'Buscar',
          hintStyle: TextStyle(color: Colors.white),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
