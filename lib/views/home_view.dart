import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:to_do_app/views/create_todo_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff454B1B),
      appBar: AppBar(
        elevation: 0,
        actions: [
          Icon(Icons.filter_list_rounded),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.search)
        ],
        title: Text(
          'My Tasks',
        ),
        backgroundColor: Color(0xff454B1B),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1613740105081-e88271c0211f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xffF0F4FF),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline_outlined),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Plan a trip to dubai',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff44527E),
                          ),
                        ),
                        Text(
                          'Planning the trip',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    )),
                    Row(
                      children: [Icon(Icons.notifications), Text('Yesterday')],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: 5),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: InkWell(
          onTap: () {
            showBarModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return Card(
                          child: Row(
                            children: [
                              Icon(Icons.check_circle_outline_outlined),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Plan a trip to dubai',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff44527E),
                                    ),
                                  ),
                                  Text(
                                    'Planning the trip',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              )),
                              Row(
                                children: [
                                  Icon(Icons.notifications),
                                  Text('Yesterday')
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: 5);
                });
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.check_circle),
                  Expanded(child: Text('Completed')),
                  Text('24')
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return CreateTodoView();
            },
          ));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff454B1B),
      ),
    );
  }
}
