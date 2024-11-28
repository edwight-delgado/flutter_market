import 'package:flutter/material.dart';
import 'screen/tienda_store_bloc.dart';
import 'screen/tienda_provider.dart';
import 'screen/tienda_store_list.dart';
import 'contast.dart';

class TiendaCategories extends StatefulWidget {
  const TiendaCategories({super.key});

  @override
  State<TiendaCategories> createState() => _TiendaCategoriesState();
}

class _TiendaCategoriesState extends State<TiendaCategories> {
  final bloc = TiendaStoreBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final arg = ModalRoute.of(context)!.settings.arguments as String;
    print("query $arg");
    final String query = arg;
    print(query);
    //final width = MediaQuery.of(context).size.width;
    return TiendaProvider(
      bloc: bloc,
      child: AnimatedBuilder(
          animation: bloc,
          builder: (context, _) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: yellowColor,
                title: const Text('Market'),
                leading: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
              ),
              drawer: Drawer(
                child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: [
                      const DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Text('Drawer Header'),
                      ),
                      ListTile(
                        title: const Text('Item 1'),
                        onTap: () {
                          // Update the state of the app.
                          // ...
                        },
                      ),
                    ]),
              ),
              body: Stack(children: [
                AnimatedPositioned(
                  duration: panelTransition,
                  curve: Curves.decelerate,
                  left: 0,
                  right: 0,
                  top: 0,
                  child: SizedBox.shrink(),
                ),
                AnimatedPositioned(
                  duration: panelTransition,
                  curve: Curves.decelerate,
                  left: 0,
                  right: 0,
                  top: kToolbarHeight,
                  height: size.height - kToolbarHeight,
                  child: TiendaStoreList(
                    query: '4',
                  ),
                ),
              ]),
            );
          }),
    );
  }
}
                // ignore: prefer_const_literals_to_create_immutables
               