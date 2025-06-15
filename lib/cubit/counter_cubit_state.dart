part of 'counter_cubit_cubit.dart';

@immutable
sealed class CounterCubitState {}

final class CounterAInCrementState extends CounterCubitState {}
final class CounterBInCrementState extends CounterCubitState {}
final class CounterReset extends CounterCubitState {}




