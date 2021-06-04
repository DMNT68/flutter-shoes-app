import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/model/zapato_model.dart';
import 'package:shoes_app/src/widgets/custom_wigets.dart';
import 'package:animate_do/animate_do.dart';


class ZapatoDescripcionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // cambiarStatusLight();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'zapato-1',
                child: ZapatoSizePreview(fullScreen:true)
              ),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  child: Icon(Icons.chevron_left_rounded, color: Colors.white, size: 60,),
                  onPressed: (){
                    // cambiarStatusDark();
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                  
                )
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _MontoBuyNow(),
                  _ColoresYMas(),
                  _BotonesLikeCartSettings()
                ],
              ),
            ) 
          )
        ],
     ),
   );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(Icon(Icons.star, color: Colors.red, size: 25,)),
          _BotonSombreado(Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25,)),
          _BotonSombreado(Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25,)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  
  final Icon icon;
  
  _BotonSombreado(this.icon) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: -5, blurRadius: 20, offset: Offset(0,10))
        ]
      ),
      child: this.icon,
    );
  }
}

class _ColoresYMas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(left: 90, child: _BotonColor(Color(0xffC6D642), 1, 'assets/imgs/verde.png')),
                Positioned(left: 60, child: _BotonColor(Color(0xffFFAD29), 2, 'assets/imgs/amarillo.png')),
                Positioned(left: 30, child: _BotonColor(Color(0xff2099F1), 3, 'assets/imgs/azul.png')),
                _BotonColor(Color(0xff364D56), 4, 'assets/imgs/negro.png'),
              ],
            )
          ),
          BotonNaranga(texto: 'More related items', alto: 30, ancho: 150, color: Color(0xffFFC675),)
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {

  final Color color;
  final int index;
  final String urlImg;

  _BotonColor(this.color, this.index, this.urlImg);
  
  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () => zapatoModel.assetImage = this.urlImg,
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            Text('\$180.0', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            Spacer(),
            Bounce(
              delay: Duration(milliseconds: 300),
              from: 8,
              child: BotonNaranga(texto: 'Buy Now', ancho: 120, alto: 40,)
            )
          ],
        ),
      ),
    );
  }
}