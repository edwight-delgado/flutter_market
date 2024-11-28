import 'package:flutter/material.dart';
import 'package:map_mark/screen/tienda_product.dart';

class StoreDetails extends StatefulWidget {
  const StoreDetails(
      {super.key, required this.product, required this.onProductAdded});
  final TiendaProduct product;
  final VoidCallback onProductAdded;

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  String heroTag = '';
  void _addToCart(BuildContext context) {
    setState(() {
      heroTag = 'details';
    });
    widget.onProductAdded();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Hero(
              tag: 'market_${widget.product.name}',
              child: CircleAvatar(
                backgroundColor: Colors.amber[700],
                child: Image.asset(widget.product.market),
              )),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
        child: Column(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'list_${widget.product.name}$heroTag',
                  child: Image.asset(
                    widget.product.images,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text('titulo',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 30)),
                Text(
                  '500 gr',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                ),
                Row(
                  children: [
                    Spacer(),
                    Text('${widget.product.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 12.0,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'About of the Product',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 120,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Text(
                      '${widget.product.description}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w200, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 20,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
      floatingActionButton: Container(
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: IconButton(
                        color: Colors.black,
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border)),
                  ),
                  Expanded(
                      flex: 4,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xFFFF4C459)),
                        ),
                        onPressed: () {
                          _addToCart(context);
                        },
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ))
                ],
              ))),
    );
  }
}
