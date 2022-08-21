import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import 'listorden_page.dart';

class UsdtPage extends StatefulWidget {
  const UsdtPage({Key? key}) : super(key: key);

  @override
  State<UsdtPage> createState() => _UsdtPageState();
}

class _UsdtPageState extends State<UsdtPage> {
  File? file;
  ImagePicker image = ImagePicker();
  String url = "";
  String? name;
  var color1 = Colors.redAccent[700];
  String? imageDpiAnverso;
  //Recibo
  getImage() async {
    var img = await image.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
    if (file != null) {
      //uploadFileA();
    }
  }

  opcionesAnverso(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Seleccione una opcion:'),
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      getImage();
                    },
                    splashColor: Colors.orange,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Tomar una foto',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.orange,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  final TextEditingController controllerTo = TextEditingController();

  // This function is triggered when the copy icon is pressed
  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: controllerTo.text));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Texto Copiado'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Metodo pago Usdt',
          style: TextStyle(
              fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Text(
              'USDT TRC20',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    controller: controllerTo,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: IconButton(
                        alignment: Alignment.topRight,
                        onPressed: _copyToClipboard,
                        icon: const Icon(
                          textDirection: TextDirection.rtl,
                          Iconsax.copy,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 85,
            ),
            //boton para ver acciones
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      opcionesAnverso(context);
                    },
                    child: Icon(
                      Iconsax.camera,
                      color: Colors.black,
                      size: 44,
                    ),
                  ),
                  Text(
                    "Adjuntar",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  //boton para nueva orden
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const OrdenListPage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Siguiente',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
