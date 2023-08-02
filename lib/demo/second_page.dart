import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int count = 0;
  @override
  void didChangeDependencies() {
    count = ModalRoute.of(context)?.settings.arguments as int;    
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: ()=>Navigator.pop(context,count),
          child: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text('Second page')),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$count'),
        ],
      )),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          count++;
        });
      }),
    );
  }
}