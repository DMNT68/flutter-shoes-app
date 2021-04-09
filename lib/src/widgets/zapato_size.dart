import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/model/zapato_model.dart';
import 'package:shoes_app/src/pages/zapato_desc_page.dart';

class ZapatoSizePreview extends StatelessWidget {

  final bool fullScreen;

  const ZapatoSizePreview({
    this.fullScreen = false
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        if(!fullScreen){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ZapatoDescripcionPage())); 
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen) ? 5 : 30, 
          vertical: (fullScreen) ? 5 : 0
        ),
        child: Container(
          width: double.infinity,
          height: (fullScreen) ? 410 : 430,
          decoration: BoxDecoration(
            color:Color(0xffFFCF53),
            borderRadius: (!fullScreen) 
              ? BorderRadius.circular(50) 
              : BorderRadius.only(
                  bottomLeft: Radius.circular(50), 
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
              ) 
          ),
          child: Column(
            children: [
              _ZapatoConSombra(),
              if(!fullScreen)_ZapatoTallas()
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 0,
            child: _ZapatoSombra()
          ),
          Image(image: AssetImage(zapatoModel.assetImage))
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 220,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
          ]
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _CajaZapatoTalla(numero:7),
          _CajaZapatoTalla(numero: 7.5, ),
          _CajaZapatoTalla(numero: 8, ),
          _CajaZapatoTalla(numero: 8.5, ),
          _CajaZapatoTalla(numero: 9, seleccionado: true),
          _CajaZapatoTalla(numero: 9.5, ),
        ],
      ),
    );
  }
}

class _CajaZapatoTalla extends StatelessWidget {

  final double numero;
  final bool seleccionado;

  _CajaZapatoTalla({this.numero, this.seleccionado=false});

  @override
  Widget build(BuildContext context) {

     final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        zapatoModel.talla=this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: (this.numero ==zapatoModel.talla) ? Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (this.numero ==zapatoModel.talla) BoxShadow(color: Color(0xffF1A23A), blurRadius: 10, offset: Offset(0,5))
          ]
        ),
        child: Text(
          '${numero.toString().replaceAll('.0', '')}', 
          style: TextStyle(
            color: (this.numero ==zapatoModel.talla) ? Colors.white : Color(0xfff1a23a),
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}