import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiModel extends StatefulWidget {
  const ApiModel({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ApiModelState();
  }
}

class _ApiModelState extends State<ApiModel> {
  String response = '';

  void _consultaApi() async {
    final response = await http.get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));

    Map<String, dynamic> data = await json.decode(response.body);

    setState(() {
      this.response = data['bpi']['USD']['rate'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 200,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Colors.amber[400],
          ),
          child: const Text('Requisição API', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Text(response.isNotEmpty ? '\$$response' : '', style: const TextStyle(color: Colors.black),),
        TextButton.icon(
          onPressed: _consultaApi, 
          icon: const Icon(Icons.currency_bitcoin_outlined, color: Colors.black,), 
          label: const Text('Ver preço do BTC', style: TextStyle(color: Colors.black),),
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(Colors.amber.shade400),
          ),
          ),
      ],
    );
  }
}
