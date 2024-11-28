class TiendaProduct {
  const TiendaProduct(
      {required this.id,
      required this.price,
      required this.name,
      required this.description,
      required this.market,
      required this.images});
  final String id;
  final double price;
  final String name;
  final String description;
  final String market;
  final String images;
}

const tiendaProducts = <TiendaProduct>[
  TiendaProduct(
      id: '1',
      price: 8.65,
      name: 'avocado1',
      description:
          """lorem otra cosa esto es una breve descripcion de un producto 
          para mostrar el ejemplo de parafo usando flutter description avocado 
          lorem otra cosa esto es una breve descripcion de un producto para 
          mostrar el ejemplo de parafo usando flutter description avocado 

          lorem otra cosa esto es una breve descripcion de un producto 
          para mostrar el ejemplo de parafo usando flutter description avocado 
          lorem otra cosa esto es una breve descripcion de un producto para 
          mostrar el ejemplo de parafo usando flutter description avocado 
          """,
      market: 'img/images.png',
      images: 'img/product/img_1.png'),
  TiendaProduct(
      id: '2',
      price: 4.65,
      name: 'banana2',
      description: 'description banana ',
      market: 'img/papas.png',
      images: 'img/product/banana.png'),
  TiendaProduct(
      id: '2',
      price: 8.65,
      name: 'avocado3',
      description: 'description avocado ',
      market: 'img/starbucks.png',
      images: 'img/product/mani.png'),
  TiendaProduct(
      id: '3',
      price: 8.65,
      name: 'mantequilla2',
      description: 'description mantequilla ',
      market: 'img/images.png',
      images: 'img/product/Mantequilla.png'),
  TiendaProduct(
      id: '3',
      price: 4.65,
      name: 'banana4',
      description: 'description banana ',
      market: 'img/kfc.png',
      images: 'img/product/pina.png'),
  TiendaProduct(
      id: '3',
      price: 8.65,
      name: 'avocado5',
      description: 'description avocado ',
      market: 'img/papas.png',
      images: 'img/product/queso.png'),
  TiendaProduct(
      id: '4',
      price: 4.65,
      name: 'banana6',
      description: 'description banana ',
      market: 'img/pizzahunt.png',
      images: 'img/product/queso2.png'),
];
