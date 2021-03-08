import 'package:spotiamigos/models/plan.dart';
import 'package:spotiamigos/services/database_service.dart';
import 'package:spotiamigos/utils/constants_utils.dart';

class PlanService {
  static PlanService _planService;
  static DatabaseService _databaseService = DatabaseService();

  PlanService._();

  factory PlanService() {
    if (_planService == null) {
      _planService = PlanService._();
    }
    return _planService;
  }

  save(Plan plan) async {
    final db = await _databaseService.getDatabase;
    return await db.insert(ConstantsUtils.PLAN_TABLE, plan.toJson());
  }

  Future<Plan> findById(int id) async {
    final db = await _databaseService.getDatabase;
    final result = await db
        .query(ConstantsUtils.PLAN_TABLE, where: "id = ?", whereArgs: [id]);
    return result.isNotEmpty ? Plan.fromJson(result.first) : null;
  }

  Future<List<Plan>> findAll() async {
    final db = await _databaseService.getDatabase;
    final result = await db.query(ConstantsUtils.PLAN_TABLE);
    return result.isNotEmpty
        ? result.map((e) => Plan.fromJson(e)).toList()
        : [];
  }

  Future<int> update(Plan plan) async {
    final db = await _databaseService.getDatabase;
    return await db.update(ConstantsUtils.PLAN_TABLE, plan.toJson(),
        where: "id = ?", whereArgs: [plan.id]);
  }

  Future<int> delete(int id) async {
    final _db = await _databaseService.getDatabase;
    return _db
        .delete(ConstantsUtils.PLAN_TABLE, where: "id = ?", whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    final db = await _databaseService.getDatabase;
    return db.delete(ConstantsUtils.PLAN_TABLE);
  }
}
