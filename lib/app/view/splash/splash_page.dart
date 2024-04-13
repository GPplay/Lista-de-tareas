import 'package:flutter/material.dart';
import 'package:listaactividades/app/view/components/decoration.dart';
import 'package:listaactividades/app/view/components/h1.dart';
import 'package:listaactividades/app/view/task_list/task_list_page.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

@override
Widget build(BuildContext context) {
    return Scaffold(
        body:  Column(
              children: [
                const Row(
                  children: [
                    Decoracion()
                  ],
                ),
                const SizedBox(height: 79,),
                Image.asset('assets/image/tareas-imagen.png',
                    width: 180,
                    height: 168,
                    ),
                    const SizedBox(height: 99,),
                    const H1('Lista de tareas'),
                const SizedBox(height: 21,),
                
                GestureDetector(
                  onTap: () {
                    // ignore: avoid_print
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return const TaskListPage();
                    }));
                  },
                    child: const Padding(padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text('La mejor forma para que no se te olvide nada es anotarlo. Guardar tus tareas y ve completando poco a poco para aumentar tu productividad',
                        textAlign: TextAlign.center,
                          ),
                        ),
                  ),
              ],
    ),
    );
  }
}
