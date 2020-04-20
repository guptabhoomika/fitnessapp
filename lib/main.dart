import 'package:fitnessapp_ui/colors.dart';
import 'package:fitnessapp_ui/fomatDate.dart';
import 'package:fitnessapp_ui/homePageBloc.dart';
import 'package:fitnessapp_ui/monthData.dart';
import 'package:fitnessapp_ui/radial.dart';
import 'package:fitnessapp_ui/top_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  AnimationController _iconController;
  HomePageBloc _homePageBloc;
  @override
  void initState() {
    // TODO: implement initState
    _iconController = AnimationController(vsync: this,duration: Duration(milliseconds: 300));
    _homePageBloc = HomePageBloc();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _homePageBloc.dispose();
    _iconController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
    Column(
  
              children: <Widget>[
  
                Stack(
  
                  children: <Widget>[
  
                    TopBar(),
  
                    Positioned(
  
                      top: 60,
  
                      left: 0,
  
                      right: 0,
  
                      child: Row(
  
                        children: <Widget>[
  
                          IconButton(
  
                            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
  
                            onPressed: (){
  
                             
  
                                _homePageBloc.subDate();
  
                            
  
                            },
  
                          ),
  
                          StreamBuilder(
  
                            stream:_homePageBloc.dateStream,
  
                            initialData: _homePageBloc.selectedDate,
                          
  
                            builder: (context, snapshot) {
  
                              return Expanded(
  
                                child: Column(
  
                                  children: <Widget>[
  
                                    Text(formatterDayOfWeek.format(snapshot.data),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white,letterSpacing: 1.2,fontSize: 24),),
  
                                    Text(" ",style: TextStyle(fontSize: 5),),
  
                                    Text(formatterDate.format(snapshot.data),style: TextStyle(color:Colors.white,letterSpacing: 1.3,fontSize: 20))
  
                                  ],
  
                                ),
  
                              );
  
                            }
  
                          ),
  
                          Transform.rotate(
  
                            angle: 135,
  
                          child: IconButton(
  
                            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
  
                            onPressed: (){
  
                             
  
                                
  
                                _homePageBloc.addDate();
  
                             
  
                            },
  
                          ),)
  
                        ],
  
                      ),
  
                    ),
  
                ]),
                SizedBox(height: 5,),
                
                  
                  RadialProgress(),
                SizedBox(height: 10,),
                
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    //color: Colors.red,
                    height:200,
                    child: MonthlyStatusListing()),
                )
  
              ],
  
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Container(
                 alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 4.0)),
                child: IconButton(
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,progress: _iconController.view),
                     onPressed: onIconPressed)),
            ),
            

],
        ),
      ),
      
    );

  }
   void onIconPressed() {
    animationStatus
        ? _iconController.reverse()
        : _iconController.forward();
  }

  bool get animationStatus {
    final AnimationStatus status = _iconController.status;
    return status == AnimationStatus.completed;
  }
 

}

