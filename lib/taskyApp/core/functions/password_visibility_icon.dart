import 'package:flutter/material.dart';

passwordIconFunction(bool check) {
  if (check == false) {
    IconButton(onPressed: () {}, icon: const Icon(Icons.visibility));
  } else {
    return null;
  }
}
