import 'package:bloc/bloc.dart';
import 'package:coinapp/models/data_model.dart';
import 'package:coinapp/repository/coin_repository.dart';
import 'package:equatable/equatable.dart';

part 'coin_data_event.dart';
part 'coin_data_state.dart';

class CoinDataBloc extends Bloc<CoinDataEvent, CoinDataState> {
  final CoinRepository coinRepository;

  CoinDataBloc(
    this.coinRepository,
  ) : super(CoinDataInitialState()) {
    on<CoinDataEvent>((event, emit) async {
      if (event is LoadGameDataEvent) {
        emit(CoinDataLoadingState());
        List<CryptoModel>? apiResult = await coinRepository.getCoinData();
        if (apiResult == null) {
          emit(CoinDataErrorState());
        } else {
          emit(CoinDataLoadedState(apiResult: apiResult));
        }
      }
    });
  }
}
