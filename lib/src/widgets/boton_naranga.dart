import 'package:flutter/material.dart';

class BotonNaranga extends StatelessWidget {

  final String texto;
  final double alto;
  final double ancho;
  final Color color;

  const BotonNaranga({
    @required this.texto, 
    this.alto = 50, 
    this.ancho = 150, 
    this.color = Colors.orange
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () { print('boton naranga'); },
      elevation: 100,
      splashColor: Colors.black,
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
        child: Container(
          alignment: Alignment.center,
          width: ancho,
          height: alto,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: color
          ),
          child: Text('$texto', style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}