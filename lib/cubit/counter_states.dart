abstract class CounterStates {
  final int count;
  CounterStates(this.count);

}

class CounterInit extends CounterStates{
  CounterInit() : super(0);
}

class CounterUpdate extends CounterStates{
  CounterUpdate(super.count);
}



