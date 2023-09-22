import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double weight = 0;
  double height = 0;
  double bmi = 0;
  String bmiCategory = '';
  String text="";
  String imagen="https://thumbs.dreamstime.com/z/escala-de-suelo-control-peso-m%C3%A9dico-con-bmi-o-%C3%ADndice-masa-corporal-medidor-marcado-d-representaci%C3%B3n-en-el-fondo-blanco-226377122.jpg";

  void calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));

      if (bmi < 18.5) {
        bmiCategory = 'B A J O  P E S O';
        text="ALIMENTESE JOVEN";
        imagen="https://thumbs.dreamstime.com/z/adolescente-flaco-que-se-coloca-sonriente-parte-de-serie-de-los-miembros-de-la-familia-de-personajes-de-dibujos-animados-84984150.jpg";
      } else if (bmi >= 18.5 && bmi < 25) {
        bmiCategory = 'N O R M A L';
        text="SALUD SALUDABLE JOVEN";
        imagen="https://c8.alamy.com/compes/jma5yt/colorido-caricatura-flaco-en-pantalones-y-camiseta-con-peinado-jma5yt.jpg";
      } else if (bmi >= 25 && bmi < 30) {
        bmiCategory = 'S O B R E P E S O';
        text="ALIMENTESE BIEN JOVEN  ";
        imagen="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn_uD46o4QyvmUS2ejwOcs5c-oTJ__m-O3Ug&usqp=CAU";
      } else {
        bmiCategory = 'O B E S I D A D';
        text="SOBRE EXEDIO SU PESO JPVEN";
        imagen="https://img.pikbest.com/png-images/qiantu/ball-fat-boy-obesity-hand-drawn-cartoon_2721659.png!w700wp";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI APP'),
        ),
        body: Center(
          child: Column(
            children: [
              Slider(
                min: 0,
                max: 300,
                value: weight,
                onChanged: (value) {
                  setState(() {
                    weight = value;
                  });
                },
              ),
              Text('PESO: ${weight.toStringAsFixed(0)} Kg'),
              Slider(
                min: 0,
                max: 250,
                value: height,
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
              ),
              Text('Altura: ${height.toStringAsFixed(0)} cm'),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  calculateBMI();
                },
                child: Text('CALCULAR'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                '$bmiCategory',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                text,
                style: TextStyle(fontSize: 20),
              ),Image.network(imagen,width: 150,height: 150,)
            ],
          ),
        ),
      ),
    );
  }
}
