part of 'tickets_cubit.dart';

enum TicketTabType { open, pending, closed }

class TicketsState extends Equatable {
  final TicketTabType selectedTab;

  const TicketsState({this.selectedTab = TicketTabType.open});

  TicketsState copyWith({TicketTabType? selectedTab}) {
    return TicketsState(selectedTab: selectedTab ?? this.selectedTab);
  }

  @override
  List<Object> get props => [selectedTab];
}
