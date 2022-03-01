part of 'coin_data_bloc.dart';

abstract class CoinDataState extends Equatable {
  const CoinDataState();

  @override
  List<Object> get props => [];
}

class CoinDataInitialState extends CoinDataState {}

class CoinDataLoadingState extends CoinDataState {}

class CoinDataLoadedState extends CoinDataState {
  final List<CryptoModel> apiResult;
  const CoinDataLoadedState({
    required this.apiResult,
  });
}

class CoinDataErrorState extends CoinDataState {}
