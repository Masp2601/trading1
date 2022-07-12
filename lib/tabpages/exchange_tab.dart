import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web3dart/contracts.dart';

class ExchangeTabPage extends StatefulWidget {
  const ExchangeTabPage({Key? key}) : super(key: key);

  @override
  State<ExchangeTabPage> createState() => _ExchangeTabPageState();
}

class _ExchangeTabPageState extends State<ExchangeTabPage> {
  bool data = false;
  int myAmount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Intercambio",
              style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
        ),
        body: ZStack([
          VxBox()
              .orange500
              .size(context.screenWidth, context.percentHeight * 30)
              .make(),
          VStack([
            (context.percentHeight * 10).heightBox,
            "Comprar / Vender".text.xl4.white.bold.center.makeCentered().py16(),
            (context.percentHeight * 5).heightBox,
            VxBox(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.left,
                  maxLength: 4,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      hintText: '0',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 32.0,
                      ),
                      icon: Icon(
                        Icons.attach_money,
                        color: Colors.black,
                        size: 50,
                      )),
                ),
              ),
            )
                .white
                .p16
                .size(context.screenWidth, context.percentHeight * 18)
                .rounded
                .shadowXl
                .make()
                .p16(),
            30.heightBox,
            HStack(
              [
                TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.teal,
                      backgroundColor: Colors.orange,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    label: "Refrescar".text.white.make().h(20)),
                TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.teal,
                      backgroundColor: Colors.green,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    icon: const Icon(
                      Icons.call_made_outlined,
                      color: Colors.white,
                    ),
                    label: "Comprar".text.white.make().h(20)),
                TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.teal,
                      backgroundColor: Colors.red,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    icon: const Icon(
                      Icons.call_received_outlined,
                      color: Colors.white,
                    ),
                    label: "Vender".text.white.make().h(20)),
              ],
              alignment: MainAxisAlignment.spaceAround,
              axisSize: MainAxisSize.max,
            ).p16()
          ])
        ]));
  }
}
