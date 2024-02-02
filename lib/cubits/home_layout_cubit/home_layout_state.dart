abstract class HomeLayoutStates {}


class HomeLayoutInitialState extends HomeLayoutStates{

}


class HomeLayoutChangeIndexState extends HomeLayoutStates{
  int index;

  HomeLayoutChangeIndexState({required this.index});
}