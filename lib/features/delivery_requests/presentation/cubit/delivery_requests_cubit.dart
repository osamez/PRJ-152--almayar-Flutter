import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delivery_requests_state.dart';

class DeliveryRequestsCubit extends Cubit<DeliveryRequestsState> {
  DeliveryRequestsCubit() : super(DeliveryRequestsInitial());
}
