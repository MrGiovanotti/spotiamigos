import 'package:flutter/material.dart';
import 'package:spotiamigos/utils/validators_utils.dart';

class AddParticipant extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Participante'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) => ValidatorsUtils.validateEmpty(value),
                  decoration: InputDecoration(labelText: 'Nombre'),
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print('Formulario válido');
                    }
                  },
                  child: Text('Guardar'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
