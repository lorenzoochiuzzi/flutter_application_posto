import 'package:flutter/material.dart';

class MyPostinho extends StatefulWidget {
  const MyPostinho({Key? key}) : super(key: key);

  @override
  State<MyPostinho> createState() => _MyPostinhoState();
}

class _MyPostinhoState extends State<MyPostinho> {
  final imagePosto = SizedBox(
    height: 80,
    width: 80,
    child: Image.asset("assets/images/bmba_de_gasolina.png"),
  );
  TextEditingController controladorTexto1 = TextEditingController();
  TextEditingController controladorTexto2 = TextEditingController();
  String valor1 = "";
  String valor2 = "";

  String calcularCombustivel(double precoGasolina, double precoAlcool) {
    double resultado = precoAlcool / precoGasolina;
    if (resultado < 0.7) {
      return "É mais vantajoso abastecer com Álcool.";
    } else {
      return "É mais vantajoso abastecer com Gasolina.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Álcool ou Gasolina",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 184, 255, 221),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              imagePosto,
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: controladorTexto1,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.greenAccent.shade200)),
                  labelText: "Digite o preço da Gasolina",
                  prefixIcon: Icon(Icons.local_gas_station),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controladorTexto2,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.greenAccent.shade200)),
                  labelText: "Digite o preço do Álcool",
                  prefixIcon: Icon(Icons.local_drink),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  double precoGasolina = double.tryParse(controladorTexto1.text) ?? 0.0;
                  double precoAlcool = double.tryParse(controladorTexto2.text) ?? 0.0;
                  String resultado = calcularCombustivel(precoGasolina, precoAlcool);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(resultado),
                  ));
                },
                child: Text("Calcular"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
