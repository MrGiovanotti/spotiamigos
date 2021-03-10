import 'package:spotiamigos/models/participant.dart';
import 'package:spotiamigos/services/database_service.dart';
import 'package:spotiamigos/utils/constants_utils.dart';

class ParticipantService {
  static ParticipantService _participantService;
  static DatabaseService _databaseService = DatabaseService();

  static const String _TABLE = ConstantsUtils.PARTICIPANTS_TABLE;

  ParticipantService._();

  factory ParticipantService() {
    if (_participantService == null) {
      _participantService = ParticipantService._();
    }
    return _participantService;
  }

  save(Participant participant) async {
    final db = await _databaseService.getDatabase;
    await db.insert(_TABLE, participant.toJson());
  }

  Future<Participant> findById(int id) async {
    final db = await _databaseService.getDatabase;
    final result = await db.query(_TABLE, where: "id = ?", whereArgs: [id]);
    return result.isNotEmpty ? Participant.fromJson(result.first) : null;
  }

  Future<List<Participant>> findAll() async {
    final db = await _databaseService.getDatabase;
    final result = await db.query(_TABLE);
    return result.isNotEmpty
        ? result.map((e) => Participant.fromJson(e)).toList()
        : [];
  }

  update(Participant participant) async {
    final db = await _databaseService.getDatabase;
    await db.update(_TABLE, participant.toJson(),
        where: "id = ?", whereArgs: [participant.id]);
  }

  delete(int id) async {
    final db = await _databaseService.getDatabase;
    await db.delete(_TABLE, where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await _databaseService.getDatabase;
    db.delete(_TABLE);
  }
}
