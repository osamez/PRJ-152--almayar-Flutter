import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pickup_request_state.dart';

class PickupRequestCubit extends Cubit<PickupRequestState> {
  PickupRequestCubit() : super(PickupRequestInitial());
}
