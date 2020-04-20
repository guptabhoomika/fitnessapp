import 'dart:async';

class HomePageBloc{
 
  DateTime selectedDate = DateTime.now();
  StreamController<DateTime> dateStreamController = StreamController<DateTime>();
  Stream<DateTime> get dateStream => dateStreamController.stream;
  void addDate()
  {
    selectedDate = selectedDate.add(Duration(days: 1));
    dateStreamController.sink.add(selectedDate);

  }
  void subDate()
  {
    selectedDate = selectedDate.subtract(Duration(days: 1));
    dateStreamController.sink.add(selectedDate);
  }
    dispose(){
      dateStreamController.close();
    }
  
  

}