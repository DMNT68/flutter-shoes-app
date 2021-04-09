import 'package:flutter/material.dart';
import 'package:shoes_app/src/widgets/custom_wigets.dart';

class AgregarCarritoBoton extends StatelessWidget {

  final double monto;

  const AgregarCarritoBoton({this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          children: [
            SizedBox(width: 20,),
            Text('\$$monto', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            Spacer(),
            BotonNaranga(texto: 'Add to cart',),
            SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}