import 'package:flutter/material.dart';

class IncrementEvent {}

class ClearEvent {}

class GetProductsListAction {}

class LoadedProductsListAction {
  final Widget pl;

  LoadedProductsListAction(this.pl);
}
