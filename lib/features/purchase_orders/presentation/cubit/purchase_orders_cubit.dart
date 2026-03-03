import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'purchase_orders_state.dart';

class PurchaseOrdersCubit extends Cubit<PurchaseOrdersState> {
  PurchaseOrdersCubit() : super(PurchaseOrdersInitial());
}
