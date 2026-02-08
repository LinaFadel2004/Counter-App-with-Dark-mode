abstract class CounterStates {
  final int count;
  CounterStates(this.count);

}

class CounterInit extends CounterStates{
  CounterInit(int currentCount) : super(currentCount);
}

class CounterUpdate extends CounterStates{
  CounterUpdate(super.count);
}



