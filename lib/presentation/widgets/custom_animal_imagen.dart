import 'package:flutter/material.dart';

class CustomAnimalImagen extends StatelessWidget {
  final String urlImg;
  const CustomAnimalImagen({super.key, required this.urlImg});

  @override
  Widget build(BuildContext context) {
    String urlAux = (urlImg.isNotEmpty || urlImg.length > 8)
        ? urlImg
        : 'https://media.istockphoto.com/id/1171729830/es/vector/colecci%C3%B3n-de-logotipos-de-animales.jpg?s=612x612&w=0&k=20&c=VfKL2vRmplyqjgGuqAMbObcEnpK7_zFqiKVwpPxAGE4=';
    final double sizeimg = MediaQuery.of(context).size.width;
    return Image.network(
      urlAux,
      scale: 1.0,
      fit: BoxFit.cover,
      width: sizeimg,
      height: sizeimg * 0.6,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;

        return Image.asset(
          'assets/animal_sin_imagen.png',
          scale: 1.0,
          fit: BoxFit.cover,
          width: sizeimg,
          height: sizeimg * 0.6,
        );
      },
      errorBuilder:
          (BuildContext context, Object error, StackTrace? stackTrace) {
        return Image.asset(
          'assets/animal_sin_imagen.png',
          scale: 1.0,
          fit: BoxFit.cover,
          width: sizeimg,
          height: sizeimg * 0.6,
        );
      },
    );
  }
}
