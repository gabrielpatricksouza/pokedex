part of 'ability_cubit.dart';

@immutable
abstract class AbilityState {}

class AbilityInitial extends AbilityState {}

class AbilityLoading extends AbilityState {}

class AbilityFinish extends AbilityState {}

class AbilityCustom extends AbilityState {}

class AbilityError extends AbilityState {}
