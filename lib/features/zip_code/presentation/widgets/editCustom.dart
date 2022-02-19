import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditCustom extends StatelessWidget {
  final Function(String) getZipCode;

  const EditCustom({Key key, this.getZipCode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        inputFormatters: [
          CepFormatter(mask: '#####-###', separator: '-'),
        ],
        controller: _controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
          ),
          hintText: 'Digita o CEP',
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              getZipCode(_controller.text);
              FocusScope.of(context).unfocus();
            },
          ),
        ),
        keyboardType: TextInputType.number,
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
