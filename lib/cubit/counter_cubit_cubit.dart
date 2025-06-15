import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterAInCrementState());


  int teamAPoints=0;
  int teamBPoints=0;

  //  InCrement Method
  void TeamInCrement({required String team,required int buttonNumber}){
   if(team=="A"){
     teamAPoints+=buttonNumber;
      emit(CounterAInCrementState());
   }else{
        teamBPoints+=buttonNumber;
        emit(CounterBInCrementState());
   }
  }

  // Reset Method
    void TeamReset(){
    teamAPoints=0;
    teamBPoints=0;
    emit(CounterReset());
    }

}
