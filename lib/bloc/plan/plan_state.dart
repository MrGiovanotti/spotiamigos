import 'package:spotiamigos/models/plan.dart';
import 'package:spotiamigos/services/plan_service.dart';

class PlanState {
  PlanService _planService = PlanService();

  addPlan(Plan plan) async {
    await _planService.save(plan);
  }

  deletePlan(int id) async {
    await _planService.delete(id);
  }

  deleteAllPlans() async {
    await _planService.deleteAll();
  }

  updatePlan(Plan plan) async {
    await _planService.update(plan);
  }

  Future<List<Plan>> getPlans() async {
    return await _planService.findAll();
  }
}
