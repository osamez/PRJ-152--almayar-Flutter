import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit() : super(const TicketsState());

  void changeTab(TicketTabType tab) {
    emit(state.copyWith(selectedTab: tab));
  }
}
