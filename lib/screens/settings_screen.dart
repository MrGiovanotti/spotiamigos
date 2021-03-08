import 'package:flutter/material.dart';
import 'package:spotiamigos/bloc/plan/plan_bloc.dart';
import 'package:spotiamigos/bloc/plan/plan_events.dart';
import 'package:spotiamigos/models/plan.dart';
import 'package:spotiamigos/utils/validators_utils.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();

  final PlanBloc _planBloc = PlanBloc();

  @override
  void initState() {
    super.initState();
    _planBloc.planSink.add(GetAllPlansEvent());
  }

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
              child: StreamBuilder<List<Plan>>(
                  stream: _planBloc.planStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length > 0) {
                        Plan savedPlan = snapshot.data[0];
                        _priceController.text = savedPlan.price.toString();
                        _ivaController.text = savedPlan.iva.toString();
                      }
                      return Column(
                        children: [
                          _createDoubleFormField(
                              _priceController, 'Precio del Plan', 'Ejm: 9.99'),
                          _createDoubleFormField(
                              _ivaController, 'IVA', 'Ejm: 12'),
                          RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Plan plan = Plan(
                                    id: 1,
                                    price: double.parse(_priceController.text),
                                    iva: double.parse(_ivaController.text));
                                if (snapshot.data.length == 0) {
                                  _planBloc.planSink.add(AddPlanEvent(plan));
                                } else {
                                  _planBloc.planSink.add(UpdatePlanEvent(plan));
                                }
                                Navigator.pop(context);
                              }
                            },
                            child: Text('Guardar'),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                          )
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
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
