import 'package:flutter/material.dart';
import 'package:spotiamigos/utils/validators_utils.dart';

class SettingsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _priceController = TextEditingController();
    TextEditingController _ivaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurar Plan'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _createDoubleFormField(
                      _priceController, 'Precio del Plan', 'Ejm: 9.99'),
                  _createDoubleFormField(_ivaController, 'IVA', 'Ejm: 12'),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print('El formulario es válido');
                      }
                    },
                    child: Text('Guardar'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                  )
                ],
              )),
        ),
      ),
    );
  }

  TextFormField _createDoubleFormField(
      TextEditingController controller, String labelText, String helperText) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      validator: (value) => ValidatorsUtils.validateEmptyOrDouble(value),
      decoration: InputDecoration(
        labelText: labelText,
        helperText: helperText,
      ),
    );
  }
}
