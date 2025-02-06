import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/bloc/bottom_nav_states.dart';

import 'bottom_nav_events.dart';

class BottomNavBloc extends Bloc<BottomNavBarEvent, BottomNavState>{
  BottomNavBloc():super(BottomNavBarSelected(0)){
    on<OnItemTapped>((event,emit){
      emit(BottomNavBarSelected(event.index));
    });
  }
}