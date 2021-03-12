import 'dart:async';

import 'package:spotiamigos/bloc/participants/participants_events.dart';
import 'package:spotiamigos/bloc/participants/participants_state.dart';
import 'package:spotiamigos/models/participant.dart';

class ParticipantsBloc {
  ParticipantsState _participantsState = ParticipantsState();

  StreamController<ParticipantsEvent> _input = StreamController.broadcast();
  StreamController<List<Participant>> _output = StreamController();

  Stream<List<Participant>> get participantStream => _output.stream;
  StreamSink<ParticipantsEvent> get participantSink => _input.sink;

  ParticipantsBloc() {
    _input.stream.listen(onEvent);
  }

  onEvent(ParticipantsEvent event) async {
    if (event is AddParticipantEvent) {
      _participantsState.addParticipant(event.participant);
    } else if (event is UpdateParticipantEvent) {
      _participantsState.updateParticipant(event.participant);
    } else if (event is RemoveParticipantEvent) {
      _participantsState.deleteParticipant(event.id);
    }
    List<Participant> participants = await _participantsState.getParticipants();
    _output.add(participants);
  }

  dispose() {
    _input.close();
    _output.close();
  }
}
