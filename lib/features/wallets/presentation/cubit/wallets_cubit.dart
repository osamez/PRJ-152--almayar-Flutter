import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wallets_state.dart';

class WalletsCubit extends Cubit<WalletsState> {
  WalletsCubit() : super(WalletsInitial());
}
