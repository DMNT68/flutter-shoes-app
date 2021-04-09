import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  
  final String texto;
  final IconData icono;

  CustomAppBar({
    @required this.texto, 
    this.icono
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: EdgeInsets.only(top: 30),
          width: double.infinity,
          child: Row(
            children: [
              Text(this.texto, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
              Spacer(),
              (this.icono != null) ? IconButton(icon: Icon(this.icono, size: 30,), onPressed: (){}, splashRadius: 25, splashColor: Color(0xffFFCF53),)  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}