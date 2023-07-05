import 'package:flutter/material.dart';
import 'package:riverpod_demo001/model/api_model.dart';

Widget cardWidget(Suggestion result) {
  return Padding(
    padding: const EdgeInsets.only(left: 0, right: 10, top: 10, bottom: 10),
    child: Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.orange[100],
      ),
      child: Column(
        children: [
          Text(result.name),
          Text(result.email),
          Text(result.username),
          Text(result.website),
        ],
      ),
    ),
  );
}
