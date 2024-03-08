import 'package:flutter/material.dart';
import 'package:primeiro/pages/page_api_model.dart';
import 'package:primeiro/pages/page_todo.dart';
import 'package:primeiro/pages/page_me.dart';
import 'pages/page_indicator.dart';

class StepForm extends StatefulWidget {
  const StepForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StepFormState();
  }
}

class _StepFormState extends State<StepForm> {
  final _stepFormController = PageController();
  int _page = 0;

  final List _pagesList = [
    const PageTodo(),
    const AboutMe(),
    const ApiModel()
  ];

  void _changeStep(bool nextPage) {
    if (_page < 2 && nextPage) {
      setState(() {
        _page++;
      });
      _stepFormController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else if (_page > 0 && !nextPage) {
      setState(() {
        _page--;
      });
      _stepFormController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Portfolio!',
        ),
      ),
      body: PageView.builder(
          controller: _stepFormController,
          physics:const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _pagesList[index];
          }),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: () => _changeStep(false),
              child: const Text('Anterior')),
          pageIndicator(_page == 0),
          pageIndicator(_page == 1),
          pageIndicator(_page == 2),
          TextButton( 
              onPressed: () => _changeStep(true), child: const Text('Próximo'))
        ],
      ),
    );
  }
}
