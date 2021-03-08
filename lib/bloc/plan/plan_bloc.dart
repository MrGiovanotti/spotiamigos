import 'dart:async';

import 'package:spotiamigos/bloc/plan/plan_events.dart';
import 'package:spotiamigos/bloc/plan/plan_state.dart';
import 'package:spotiamigos/models/plan.dart';

class PlanBloc {
  PlanState _planState = PlanState();

  StreamController<PlanEvent> _input = StreamController.broadcast();
  StreamController<List<Plan>> _output = StreamController();

  Stream<List<Plan>> get planStream => _output.stream;
  StreamSink<PlanEvent> get planSink => _input.sink;

  PlanBloc() {
    _input.stream.listen(onEvent);
  }

  void onEvent(PlanEvent event) async {
    if (event is AddPlanEvent) {
      _planState.addPlan(event.plan);
    } else if (event is RemoveAllPlansEvent) {
      _planState.deleteAllPlans();
    } else if (event is UpdatePlanEvent) {
      _planState.updatePlan(event.plan);
    }
    List<Plan> plans = await _planState.getPlans();
    _output.add(plans);
  }

  dispose() {
    _input.close();
    _output.close();
  }
}
