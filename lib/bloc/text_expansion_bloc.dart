import 'package:bloc/bloc.dart';
import 'package:ticket_app/bloc/text_expansion_events.dart';
import 'package:ticket_app/bloc/text_expansion_states.dart';

class TextExpansionBloc extends Bloc<TextExpansionEvent, TextExpansionState>{
  TextExpansionBloc():super(TextExpansionExpanded(false)){
    on<ToggleExpansion>((event,emit){
      emit(TextExpansionExpanded(event.isExpanded));
    });
  }
}