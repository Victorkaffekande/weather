import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

import '../models.dart';
import '../server.dart';

@immutable
abstract class AppState {}

class InitialState extends AppState {}

class LoadingState extends AppState {}

class ForecastState extends AppState {
  final Forecast forecast;
  final Placemark placemark;
  ForecastState(this.forecast, this.placemark);
}

class RefreshState extends ForecastState {
  RefreshState(super.forecast, super.placemark);
}

class LoadedState extends ForecastState {
  LoadedState(super.forecast, super.placemark);
}

@immutable
abstract class AppEvent {}

class LoadEvent extends AppEvent {}

class RefreshEvent extends AppEvent {}

class ForecastBloc extends Bloc<AppEvent, AppState> {
  ForecastBloc() : super(InitialState()) {
    on<LoadEvent>((event, emit) async {
      emit(LoadingState());
      final forecast = await Server.refresh();
      final placemark = await Server.getPlacemark();
      emit(LoadedState(forecast, placemark));
    });

    on<RefreshEvent>((event, emit) async {
      //show old data while loading new data
      if (state is LoadedState) {
        emit(RefreshState(
            (state as LoadedState).forecast, (state as LoadedState).placemark));
      } else {
        emit(LoadingState());
      }
      final forecast = await Server.refresh();
      final placemark = await Server.getPlacemark();
      emit(LoadedState(forecast, placemark));
    });
  }
}
