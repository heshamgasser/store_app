import 'package:flutter/material.dart';

void helperSnackBar (BuildContext context, String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
       message,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    ),
  );
}