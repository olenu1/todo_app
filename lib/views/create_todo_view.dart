import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTodoView extends StatelessWidget {
  CreateTodoView({Key? key}) : super(key: key);

  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();
  final TextEditingController timecontroller = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff454B1B),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff454B1B),
        centerTitle: false,
        title: Text('Create'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xffF0F4FF),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: titlecontroller,
                maxLines: 2,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff454B1B),
                    ),
                  ),
                  labelText: 'Title',
                  hintText: "Please enter your title",
                  labelStyle: TextStyle(
                    color: Color(0xff454B1B),
                  ),
                ),
                validator: (Value) {
                  if (Value!.isEmpty) {
                    return "complete title ";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descriptioncontroller,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Please enter description',
                  labelStyle: TextStyle(
                    color: Color(0xff454B1B),
                  ),
                ),
                validator: (Value) {
                  if (Value!.isEmpty) {
                    return "complete description ";
                  }
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: datecontroller,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        ).then((selectedDate) {
                          final DateFormat dateFormat =
                              DateFormat('dd/MM/yyyy');
                          datecontroller.text =
                              dateFormat.format(selectedDate!);
                        });
                      },
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        hintText: 'Please enter date',
                        labelStyle: TextStyle(
                          color: Color(0xff454B1B),
                        ),
                      ),
                      validator: (Value) {
                        if (Value!.isEmpty) {
                          return "date field not completed ";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: timecontroller,
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((selectedTime) {
                          timecontroller.text = selectedTime!.format(context);
                        });
                      },
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Time',
                        hintText: 'Please enter time',
                        labelStyle: TextStyle(
                          color: Color(0xff454B1B),
                        ),
                      ),
                      validator: (Value) {
                        if (Value!.isEmpty) {
                          return "time field not completed ";
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print(titlecontroller.text);
                    print(descriptioncontroller.text);
                    print(datecontroller.text);
                    print(timecontroller.text);
                  } else {
                    print('failed');
                  }
                },
                child: Text(
                  'Create',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff454B1B),
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
