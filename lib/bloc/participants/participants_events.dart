import 'package:spotiamigos/models/participant.dart';

abstract class ParticipantsEvent {}

class AddParticipantEvent extends ParticipantsEvent {
  final Participant participant;
  AddParticipantEvent(this.participant);
}

class UpdateParticipantEvent extends ParticipantsEvent {
  final Participant participant;
  UpdateParticipantEvent(this.participant);
}

class RemoveParticipantEvent extends ParticipantsEvent {
  int id;
  RemoveParticipantEvent(this.id);
}

class GetParticipantEvent extends ParticipantsEvent {
  int id;
  GetParticipantEvent(this.id);
}

class GetParticipantsEvent extends ParticipantsEvent {}
