import 'package:flutter/material.dart';
import 'package:map_mark/main.dart';
import 'package:map_mark/screen/tienda_product.dart';
import 'package:map_mark/screen/tienda_product_details.dart';
import 'package:map_mark/screen/tienda_provider.dart';
import 'package:map_mark/screen/tienda_store_bloc.dart';
import 'grid_item.dart';

const primaryColor = Color(0xFF40A944);
const defaultPadding = 20.0;

class TiendaStoreList extends StatefulWidget {
  final String query;
  const TiendaStoreList({super.key, required this.query});

  @override
  State<TiendaStoreList> createState() => _TiendaStoreListState();
}

class _TiendaStoreListState extends State<TiendaStoreList> {
  // ignore: non_constant_identifier_names
  Widget FavBtn() {
    return const Icon(Icons.favorite_border);
  }

  // ignore: non_constant_identifier_names
  Widget Price({required String amount}) {
    return Text.rich(
      TextSpan(
        text: "\$",
        style: TextStyle(fontWeight: FontWeight.w600, color: primaryColor),
        children: [
          TextSpan(
            text: amount,
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: "/kg",
            style:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = TiendaProvider.of(context)?.bloc;

    //TiendaStoreBloc? search = data;
    List<TiendaProduct>? search = data?.catalog
        .where((item) =>
            item.id.toLowerCase().contains(widget.query.toLowerCase()))
        .toList();
    return GridListItem(
        aspectRactio: 0.75,
        spacing: 10,
        itemCount: search!.length,
        itemBuilder: (context, index) {
          final product = search[index];
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    PageRouteBuilder(pageBuilder: (context, animation, _) {
                  return FadeTransition(
                    opacity: animation,
                    child: StoreDetails(
                        product: product,
                        onProductAdded: () {
                          data?.addProduct(product);
                        }),
                  );
                }));
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F7F7),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(defaultPadding * 1.25),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4), //color of shadow
                        spreadRadius: 2, //spread radius
                        blurRadius: 4, // blur radius
                        offset: Offset(0, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Positioned(
                          child: Hero(
                            tag: 'list_${product.name}',
                            child: Image.asset(
                              product.images!,
                              fit: BoxFit.contain,
                              width: double.infinity,
                              height: 140,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Hero(
                              tag: 'market_${product.name}',
                              child: CircleAvatar(
                                backgroundColor: Colors.amber[700],
                                child: Image.asset(product.market),
                              )),
                        ),
                      ]),
                      Text(
                        product.name!,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Fruits",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Price(amount: "20.00"),
                          FavBtn(),
                        ],
                      )
                    ],
                  )));
        });
  }
}
