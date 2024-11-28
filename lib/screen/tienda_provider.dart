import 'package:flutter/material.dart';
import 'package:map_mark/screen/tienda_store_bloc.dart';

class TiendaProvider extends InheritedWidget {
  const TiendaProvider({super.key, required this.child, required this.bloc})
      : super(child: child);

  final TiendaStoreBloc bloc;
  final Widget child;

  static TiendaProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TiendaProvider>();
  }

  @override
  bool updateShouldNotify(TiendaProvider oldWidget) {
    return true;
  }
}
