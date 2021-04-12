import 'package:FlutterBloc/features/consulta_cep/presentation/bloc/consultacep_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    var maskFormatter = new MaskTextInputFormatter(
        mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

    return Container(
      // color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          inputFormatters: [
            // maskFormatter
            CepFormatter(mask: '#####-###', separator: '-'),
          ],
          // maxLength: 8,
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

class CepFormatter extends TextInputFormatter {
  CepFormatter({this.mask, this.separator});

  final String mask;
  final String separator;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
              text:
                  '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
              selection: TextSelection.fromPosition(
                TextPosition(offset: newValue.text.length + 1),
              ));
        }
      }
    }
    return newValue;
  }
}
