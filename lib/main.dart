import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String description;

  Product({required this.name, required this.description});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda de Productos',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tienda de Productos'),
      ),
      body: TabBarNavigation(),
    );
  }
}

class TabBarNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'Lista de Productos'),
              Tab(icon: Icon(Icons.details), text: 'Detalles'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductListScreen(),
            DetailsScreen(),
          ],
        ),
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Leche', description: 'Leche fresca de la granja'),
    Product(
        name: 'Cubeta de Huevos', description: 'Cubeta con huevos orgánicos'),
    Product(name: 'Arroz', description: 'Arroz blanco de alta calidad'),
    Product(name: 'Harina', description: 'Harina de trigo para hornear'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductListItem(product: products[index]);
      },
    );
  }
}

class ProductListItem extends StatelessWidget {
  final Product product;

  ProductListItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text(product.description),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Producto ${product.name}'),
      ),
      body: Center(
        child: Text(product.description),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(''),
    );
  }
}
