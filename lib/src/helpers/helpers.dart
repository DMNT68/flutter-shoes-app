import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;

void cambiarStatusLight () {
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.light);
}

void cambiarStatusDark () {
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.dark);
}

void cambiarNavigationBar () {
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white
  ));
}