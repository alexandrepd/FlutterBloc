import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_zipcode_br/features/zip_code/presentation/bloc/zip_code_bloc.dart';
import 'package:flutter_bloc_zipcode_br/services/service_locator.dart';

class EditCustom extends StatelessWidget {
  final Function(TextEditingController) getController;

  EditCustom({this.getController});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            inputFormatters: [
              CepFormatter(mask: '#####-###', separator: '-'),
            ],
            controller: _controller,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              floatingLabelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.grey),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: 'Enter the zip code',
              suffixIcon: IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  serviceLocator<ZipCodeBloc>()
                      .add(SearchCepEvent(cep: _controller.text));
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                icon: Icon(Icons.delete),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  _controller.clear();
                  serviceLocator<ZipCodeBloc>().add(ClearEvent());
                },
                label: const Text('Clear'),
              ),
              TextButton.icon(
                icon: Icon(Icons.search),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  serviceLocator<ZipCodeBloc>()
                      .add(SearchCepEvent(cep: _controller.text));
                  FocusScope.of(context).unfocus();
                },
                label: const Text('Search'),
              ),
            ],
          ),
        ],
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
