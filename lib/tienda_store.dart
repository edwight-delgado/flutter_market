import 'package:flutter/material.dart';
import 'screen/tienda_store_bloc.dart';
import 'screen/tienda_provider.dart';
import 'screen/tienda_store_list.dart';
import 'contast.dart';

class TiendaStoreHome extends StatefulWidget {
  const TiendaStoreHome({super.key});

  @override
  State<TiendaStoreHome> createState() => _TiendaStoreHomeState();
}

class _TiendaStoreHomeState extends State<TiendaStoreHome> {
  int _selectedDestination = 0;

  final bloc = TiendaStoreBloc();
  _onVerticalGesture(DragUpdateDetails details) {
    //print(details.primaryDelta);
    if (details.primaryDelta! < -7) {
      bloc.changeToCart();
    } else if (details.primaryDelta! > 12) {
      bloc.changeToNormal();
    }
  }

  _getTopForWhitePanel(TiendaState state, Size size) {
    if (state == TiendaState.normal) {
      return -cardBarHeight + kToolbarHeight;
    } else if (state == TiendaState.cart) {
      return -(size.height - kToolbarHeight - cardBarHeight / 2);
    }
    return 0.0;
  }

  _getTopForBlackPanel(TiendaState state, Size size) {
    if (state == TiendaState.normal) {
      return size.height - cardBarHeight - (kToolbarHeight * .95) - 45;
    } else if (state == TiendaState.cart) {
      return cardBarHeight / 2;
    }
    return 0.0;
  }

  _getTopForAppBar(TiendaState state) {
    if (state == TiendaState.normal) {
      return 0.0;
    } else if (state == TiendaState.cart) {
      return -cardBarHeight;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final width = MediaQuery.of(context).size.width;
    return TiendaProvider(
        bloc: bloc,
        child: AnimatedBuilder(
            animation: bloc,
            builder: (context, _) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: yellowColor,
                  title: const Text('market dabajuro'),
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
                          leading: Icon(Icons.bakery_dining),
                          title: const Text('Panaderias'),
                          subtitle: Text('3 cerca de aqui'),
                          selected: _selectedDestination == 0,
                          onTap: () {
                            Navigator.pushNamed(context, "/category",
                                arguments: "panaderias");
                            // Update the state of the app.
                            // ...
                            //void selectDestination(int index) {
                            // setState(() {
                            //   _selectedDestination = index;
                            // });
                            //selectDestination(0);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.hardware),
                          title: const Text('Fereterias'),
                          subtitle: Text('2 cerca de aqui'),
                          onTap: () {
                            Navigator.pushNamed(context, "/category",
                                arguments: "ferreteria");
                            // Update the state of the app.
                            // ...
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.local_pharmacy),
                          title: const Text('Farmacias'),
                          subtitle: Text('5 cerca de aqui'),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.local_grocery_store),
                          title: const Text('supermercados'),
                          subtitle: Text('4 cerca de aqui'),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          },
                        ),
                      ]),
                ),
                body: Stack(
                  children: [
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
                      top: _getTopForWhitePanel(bloc.tiendaState, size),
                      height: size.height - kToolbarHeight,
                      child: const TiendaStoreList(
                        query: '',
                      ),
                    ),
                    AnimatedPositioned(
                        duration: panelTransition,
                        curve: Curves.decelerate,
                        top: _getTopForBlackPanel(bloc.tiendaState, size),
                        left: 0,
                        right: 0,
                        height: size.height,
                        child: GestureDetector(
                            onVerticalDragUpdate: _onVerticalGesture,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: yellowColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 60),
                                child: SingleChildScrollView(
                                  primary: true,
                                  physics: BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(25),
                                            child: AnimatedSwitcher(
                                                duration: panelTransition,
                                                child:
                                                    bloc.tiendaState ==
                                                            TiendaState.normal
                                                        ? Row(
                                                            children: [
                                                              const Text(
                                                                'cart',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  physics:
                                                                      const BouncingScrollPhysics(),
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    children: List
                                                                        .generate(
                                                                      bloc.cart
                                                                          .length,
                                                                      (index) =>
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(right: 10),
                                                                        child:
                                                                            Hero(
                                                                          tag:
                                                                              'list_${bloc.cart[index].productItem.name}details',
                                                                          child:
                                                                              CircleAvatar(
                                                                            backgroundColor:
                                                                                Colors.white,
                                                                            child:
                                                                                Image.asset(bloc.cart[index].productItem.images),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  setState(() {
                                                                    bloc.tiendaState =
                                                                        TiendaState
                                                                            .cart;
                                                                  });
                                                                },
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  child: Center(
                                                                    child: Text(
                                                                      '${bloc.cart.length}',
                                                                      selectionColor:
                                                                          Colors
                                                                              .black,
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : const SizedBox
                                                            .shrink()),
                                          ),
                                          ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: bloc.cart.length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  leading: CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: Image.asset(bloc
                                                        .cart[index]
                                                        .productItem
                                                        .images),
                                                  ),
                                                  title: Text(bloc.cart[index]
                                                      .productItem.name),
                                                  subtitle: Row(
                                                    children: [
                                                      Text(
                                                        '34.7',
                                                        selectionColor:
                                                            Colors.white,
                                                      ),
                                                      Text(
                                                        'x 2',
                                                        selectionColor:
                                                            Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                  trailing: Text(
                                                    '23.56',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    selectionColor:
                                                        Colors.white,
                                                  ),
                                                );
                                              }),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text('Total: 234.56'),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          SizedBox(
                                              width: size.width * 0.90,
                                              child: FilledButton(
                                                  style: const ButtonStyle(
                                                      elevation:
                                                          MaterialStatePropertyAll(
                                                              9.0),
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.black)),
                                                  onPressed: () {},
                                                  child:
                                                      const Text('siguiente'))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))),
                  ],
                ),
                // ignore: prefer_const_literals_to_create_immutables
                bottomNavigationBar: bloc.tiendaState == TiendaState.normal
                    ? BottomNavigationBar(items: [
                        BottomNavigationBarItem(
                            icon: IconButton(
                                icon: const Icon(Icons.local_grocery_store),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/");
                                }),
                            label: 'product'),
                        BottomNavigationBarItem(
                            icon: IconButton(
                                icon: const Icon(Icons.map_outlined),
                                onPressed: () {
                                  Navigator.pushNamed(context, "/map");
                                }),
                            label: 'map'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.person), label: 'acount')
                      ])
                    : SizedBox.shrink(),
              );
            }));
  }
}
