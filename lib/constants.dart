import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(
  isDense: true,
  border: OutlineInputBorder(),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.3,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
  contentPadding: EdgeInsets.symmetric(
    vertical: 20.0,
    horizontal: 20.0,
  ),
);
