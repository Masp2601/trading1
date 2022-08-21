import 'package:flutter/material.dart';

class OrdenListPage extends StatefulWidget {
  const OrdenListPage({Key? key}) : super(key: key);

  @override
  State<OrdenListPage> createState() => _OrdenListPageState();
}

class _OrdenListPageState extends State<OrdenListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Estado de sus Ordenes",
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center,
            //imagen
            children: [
              Image.asset('assets/ordenes.png'),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'No hay ordenes todavía.',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Text(
                'No hay existencias recientes de su pedido, vamos',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
              const Text(
                'haz tu primera inversión...',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
              const SizedBox(
                height: 25.0,
              ),
            ]));
  }
}
