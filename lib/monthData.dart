import 'package:flutter/material.dart';
class MonthlyStatusListing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
          children: <Widget>[
    Flexible(
  
          child:
  
          Row(
  
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
            mainAxisSize: MainAxisSize.max,
  
            children: <Widget>[
  
              Column(
  
                crossAxisAlignment: CrossAxisAlignment.start,
  
                mainAxisSize: MainAxisSize.max,
  
                children: <Widget>[
                  
                   MonthlyStatusRow('March 2020', 'Completed'),
                  MonthlyStatusRow('February 2020', 'On going'),
  
                  MonthlyStatusRow('January 2020', 'Failed'),


  
                
  
                ],
  
              ),
  
              Column(
  
                crossAxisAlignment: CrossAxisAlignment.start,
  
                mainAxisSize: MainAxisSize.max,
  
                children: <Widget>[
  
                  MonthlyTargetRow('Lose weight', '3.8 ktgt/7 kg'),
  
                  MonthlyTargetRow('Running per month', '15.3 km/20 km'),
                 MonthlyTargetRow('Avg steps Per day', '10000/10000'),

            
                ],
  
              ),
  
            ],
  
          ),
  
        ),
],
    );
  }
}

class MonthlyStatusRow extends StatelessWidget {
  final String monthYear, status;

  MonthlyStatusRow(this.monthYear, this.status);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            monthYear,
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 16.0), 
          ),
          Text(
            status,
            style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}

class MonthlyTargetRow extends StatelessWidget {
  final String target, targetAchieved;

  MonthlyTargetRow(this.target, this.targetAchieved);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            target,
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
          Text(
            targetAchieved,
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}