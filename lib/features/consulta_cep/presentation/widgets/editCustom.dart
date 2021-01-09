import 'package:FlutterBloc/features/consulta_cep/presentation/bloc/consultacep_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Container(
      // color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          maxLength: 8,
          controller: _controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.teal),
            ),
            hintText: 'Digita o CEP',
            suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  BlocProvider.of<ConsultacepBloc>(context)
                      .add(SendCepEvent(cep: _controller.text));
                }),
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
