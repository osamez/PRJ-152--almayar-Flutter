import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'money_transfers_state.dart';

class MoneyTransfersCubit extends Cubit<MoneyTransfersState> {
  MoneyTransfersCubit() : super(MoneyTransfersInitial());
}
