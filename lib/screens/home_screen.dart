import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ticket_app/providers/authprovider.dart';
import 'package:ticket_app/providers/event_provider.dart';
import 'package:ticket_app/widgets/event.dart';
import 'package:ticket_app/widgets/thisweek_event.dart';
import 'package:ticket_app/utils/app_styling.dart';
import 'package:ticket_app/widgets/week_widget.dart';

//============ django filter for this week events
//>>>>>>>>>>>> bottom space

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });
  final authProvider = AuthProvider().username;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Hello ${widget.authProvider}',
                              style: Styles.headLineStyle3,
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Text('Start Booking', style: Styles.headLineStyle),
                      ],
                    ),
                  ),
                  Container(
                      height: 80,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('lib/assets/logo.png'))))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                // child: Container(
                //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Color(0xFFF4F6FD)),
                //   child: Row(
                //     children: [
                //       Icon(FluentSystemIcons.ic_fluent_search_regular,
                //           color: Color(0xFFBFC205)),
                //       SizedBox(width: 3),
                //       Text(
                //         'Search',
                //         style: Styles.headLineStyle4,
                //       )
                //     ],
                //   ),
                // ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Featured Events', style: Styles.headLineStyle2),
                  InkWell(
                    child: Text('view all',
                        style: Styles.textStyle
                            .copyWith(color: Styles.primaryColor)),
                    onTap: () {
                      context.push('/eventlist/');
                      print('eventlist view');
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                width: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => EventsView(
                      event: context.watch<EventProvider>().events[index]),

                  // child: Row(
                  // //   children: [EventView(), EventView(), EventView()],
                  // )
                ),
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // //binary logical operator
                  // if (true)
                  Text('This Weeks Events', style: Styles.headLineStyle2),
                  InkWell(
                    onTap: () {
                      print('you are tapping view all');
                    },
                    child: Text('view all',
                        style: Styles.textStyle
                            .copyWith(color: Styles.primaryColor)),
                  )
                ],
              ),
              SizedBox(height: 10),
              //list view inside a container (add height)
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [WeekEvent(), WeekEvent1()],
                  ))
            ],
          ),
        )
      ]),
    );
  }
}
