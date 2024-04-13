import 'package:flutter/material.dart';

class Decoracion extends StatelessWidget {
  const Decoracion({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/image/decoracion.png',
                      width: 141,
                      height: 129,
                      );
  }
}