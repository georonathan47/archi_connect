import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'architects_event.dart';
part 'architects_state.dart';

class ArchitectsBloc extends Bloc<ArchitectsEvent, ArchitectsState> {
  ArchitectsBloc() : super(ArchitectsInitial()) {
    on<ArchitectsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
