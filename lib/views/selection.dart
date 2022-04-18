import 'package:flutter/material.dart';
import 'package:CarConfigurator/components/option.dart';

class Selection extends StatefulWidget {
  final String title;
  final List<Option> options;
  const Selection({Key? key, required this.title, required this.options}): super(key: key);

   @override
  State<StatefulWidget> createState() => _Selection();
}

class _Selection extends State<Selection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra horizontal en la parte superior de la app
      appBar: AppBar(
        // Tomamos el valor de Homepage para usarlo en la barra
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.options.length,
        itemBuilder: (context, index) {
          final item = widget.options[index];
          return Card(
            child: ListTile(
              title: Text(item.text),
              leading: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: Image.asset(item.link, fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),

    );
  }
}