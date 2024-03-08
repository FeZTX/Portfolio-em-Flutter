import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          margin: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
              border: GradientBoxBorder(
                  width: 2,
                  gradient:
                      LinearGradient(colors: [Colors.pink, Colors.lightBlue])),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://scontent.cdninstagram.com/v/t51.29350-15/343285581_179546278352658_2441240501085149018_n.jpg?stp=dst-jpg_e35_p640x640_sh0.08&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xNDQweDE3OTYuc2RyIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=106&_nc_ohc=mODxztjn-CgAX_5yetO&edm=APs17CUBAAAA&ccb=7-5&oh=00_AfB9L2vNUKNBCmbH5yXf1T2_BlKxHIqaoEMA-lJCm3ISrA&oe=65ED807E&_nc_sid=10d13b'),
                  filterQuality: FilterQuality.high,
                  isAntiAlias: true,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter)),
        ),
        Container(
          margin: const EdgeInsets.all(25),
          child: const Text(
            'Olá, Meu nome é Felipe e eu sou Dev.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(right: 40, left: 40),
              child: const Text(
                'Recém-graduado como Analista de Sistemas;\nExperiência consolidada de 2 anos como Analista de Suporte Técnico;\nAtendimento à clientes nacionais e internacionais,\nSuporte técnico, criação e monitoramento de servidores Linux, configuração de Bots \nAPIs e Webhooks;\nCriação e gerenciamento de projetos de tecnologia, envolvendo a criação e implementação de Automatizações, Manipulação de banco de dados MongoDB e MySQL, Integração de sistemas e desenvolvimento fullstack utilizando as tecnologias:\n- Python\n- HTML + CSS + JS\n- ReactJS\n- Tauri\n- Node.',
                style: TextStyle(fontSize: 13),
              ),
            ))
      ],
    );
  }
}
