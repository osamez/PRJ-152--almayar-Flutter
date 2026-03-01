import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shipment_tracking_state.dart';

class ShipmentTrackingCubit extends Cubit<ShipmentTrackingState> {
  ShipmentTrackingCubit() : super(const ShipmentTrackingState());

  void changeTab(int index) {
    emit(state.copyWith(selectedTabIndex: index));
  }
}
