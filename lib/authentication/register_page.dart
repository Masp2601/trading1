import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trading/global/global.dart';
import 'package:trading/widgets/progress_dialog.dart';

import 'credentials_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var name, surnames, phone, purse, email, password, referred;
  final formKey = GlobalKey<FormState>();
  //controladores
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _celController = TextEditingController();
  final _purseController = TextEditingController();
  final _referredController = TextEditingController();

  validateForm() {
    if (_nameController.text.length < 3) {
      Fluttertoast.showToast(
          msg: "El nombre debe tener mas de tres caracteres");
    } else if (!_emailController.text.contains("@")) {
      Fluttertoast.showToast(msg: "El correo electronico no es valido...");
    } else if (_celController.text.isEmpty) {
      Fluttertoast.showToast(msg: "El numero de telefono es requerido.");
    } else if (_passwordController.text.length < 6) {
      Fluttertoast.showToast(
          msg: "La contraseña no puede ser menor a seis caracteres");
    } else if (_lastnameController.text.length < 3) {
      Fluttertoast.showToast(
          msg: "El apellido no puede ser menor a tres caracteres");
    } else if (_purseController.text.isEmpty) {
      Fluttertoast.showToast(msg: "El monedero es requerido.");
    } else {
      saveInforNow();
    }
  }

  saveInforNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: "Procesando, Por favor espere...",
          );
        });

    final User? firebaseUser = (await fAuth
            .createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    )
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error: " + msg.toString());
    }))
        .user;

    if (firebaseUser != null) {
      Map driverMap = {
        "id": firebaseUser.uid,
        "name": _nameController.text.trim(),
        "lastname": _lastnameController.text.trim(),
        "phone": _celController.text.trim(),
        "email": _emailController.text.trim(),
        "password": _passwordController.text.trim(),
        "purse": _purseController.text.trim(),
        "refered": _referredController.text.trim(),
      };

      DatabaseReference driverRef =
          FirebaseDatabase.instance.ref().child("Usuarios");
      driverRef.child(firebaseUser.uid).set(driverMap);

      currentFirebaseUser = firebaseUser;
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => Credentialscreen()));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "La cuenta no se a creado...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined),
            onPressed: () {},
          )),
      backgroundColor: Colors.blueGrey,
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 0.04,
                ),
                const Center(
                  child: Text("Inscribirse",
                      style: TextStyle(fontSize: 32.0, color: Colors.black)),
                ),
                const Center(
                  child: Text(
                    "solo toma un minuto crear su cuenta",
                    style: TextStyle(fontSize: 10.0, color: Colors.black87),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                //nombre usuario
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        onChanged: (val) {
                          name = val;
                        },
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nombres',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //apellido usuario
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        onChanged: (val) {
                          surnames = val;
                        },
                        controller: _lastnameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Apellidos',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //telefono usuario
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        onChanged: (val) {
                          phone = val;
                        },
                        controller: _celController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Telefono',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //monedero electronico usuario
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        onChanged: (val) {
                          purse = val;
                        },
                        controller: _purseController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Monedero virtual',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //correo electronico usuario
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        onChanged: (val) {
                          email = val;
                        },
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Correo Electronico',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //contraseña usuario
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        onChanged: (val) {
                          password = val;
                        },
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Contraseña',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // codigo referido
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        onChanged: (val) {
                          referred = val;
                        },
                        controller: _referredController,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Codigo de referido',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //boton para iniciar sesion
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      validateForm();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Crear Cuenta',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
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
        ),
      ),
    );
  }
}
