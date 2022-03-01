part of 'coin_data_bloc.dart';

abstract class CoinDataEvent extends Equatable {
  const CoinDataEvent();

  @override
  List<Object> get props => [];
}

class LoadGameDataEvent extends CoinDataEvent {}
