import 'package:spotiamigos/models/participant.dart';
import 'package:spotiamigos/services/participant_service.dart';

class ParticipantsState {
  ParticipantService _participantService = ParticipantService();

  addParticipant(Participant participant) async {
    await _participantService.save(participant);
  }

  deleteParticipant(int id) async {
    await _participantService.delete(id);
  }

  deleteAllParticipants() async {
    await _participantService.deleteAll();
  }

  updateParticipant(Participant participant) async {
    await _participantService.update(participant);
  }

  Future<Participant> getParticipant(int id) async {
    return await _participantService.findById(id);
  }

  Future<List<Participant>> getParticipants() async {
    return await _participantService.findAll();
  }
}
