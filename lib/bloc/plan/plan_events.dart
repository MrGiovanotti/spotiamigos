import 'package:spotiamigos/models/plan.dart';

abstract class PlanEvent {}

class AddPlanEvent extends PlanEvent {
  final Plan plan;
  AddPlanEvent(this.plan);
}

class RemoveAllPlansEvent extends PlanEvent {
  RemoveAllPlansEvent();
}

class UpdatePlanEvent extends PlanEvent {
  final Plan plan;
  UpdatePlanEvent(this.plan);
}

class GetAllPlansEvent extends PlanEvent {}
