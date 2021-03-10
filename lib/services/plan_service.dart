import 'package:spotiamigos/models/plan.dart';
import 'package:spotiamigos/services/database_service.dart';
import 'package:spotiamigos/utils/constants_utils.dart';

class PlanService {
  static PlanService _planService;
  static DatabaseService _databaseService = DatabaseService();

  static const String _TABLE = ConstantsUtils.PLAN_TABLE;

  PlanService._();

  factory PlanService() {
    if (_planService == null) {
      _planService = PlanService._();
    }
    return _planService;
  }

  save(Plan plan) async {
    final db = await _databaseService.getDatabase;
    await db.insert(_TABLE, plan.toJson());
  }

  Future<Plan> findById(int id) async {
    final db = await _databaseService.getDatabase;
    final result = await db.query(_TABLE, where: "id = ?", whereArgs: [id]);
    return result.isNotEmpty ? Plan.fromJson(result.first) : null;
  }

  Future<List<Plan>> findAll() async {
    final db = await _databaseService.getDatabase;
    final result = await db.query(_TABLE);
    return result.isNotEmpty
        ? result.map((e) => Plan.fromJson(e)).toList()
        : [];
  }

  update(Plan plan) async {
    final db = await _databaseService.getDatabase;
    await db
        .update(_TABLE, plan.toJson(), where: "id = ?", whereArgs: [plan.id]);
  }

  delete(int id) async {
    final _db = await _databaseService.getDatabase;
    _db.delete(_TABLE, where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await _databaseService.getDatabase;
    db.delete(_TABLE);
  }
}
