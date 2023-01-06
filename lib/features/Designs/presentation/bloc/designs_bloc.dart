import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'designs_event.dart';
part 'designs_state.dart';

class DesignsBloc extends Bloc<DesignsEvent, DesignsState> {
  DesignsBloc() : super(DesignsInitial()) {
    on<DesignsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
