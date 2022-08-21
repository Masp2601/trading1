import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class OrdenesPage extends StatefulWidget {
  const OrdenesPage({Key? key}) : super(key: key);

  @override
  State<OrdenesPage> createState() => _OrdenesPageState();
}

class _OrdenesPageState extends State<OrdenesPage> {
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

  final controllerTo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Nueva Orden",
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Colors.blueGrey,
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              const SizedBox(
                height: 35,
              ),
              buildTextField(title: 'De', controller: controllerTo),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                "Captura Solicitar Retiro:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 95,
                  ),
                  IconButton(
                    alignment: Alignment.center,
                    onPressed: () {
                      opcionesAnverso(context);
                    },
                    icon: const Icon(
                      Iconsax.camera,
                      size: 45,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 85,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    minimumSize: const Size.fromHeight(50),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text("Enviar"),
                  onPressed: () {}),
            ])));
  }

  Widget buildTextField({
    required String title,
    required TextEditingController controller,
    int maxLines = 1,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          )
        ],
      );
}
