import 'package:contact_diary/contact_list.dart';
import 'package:contact_diary/model/contact.dart';
import 'package:contact_diary/widgets/textfield.dart';
import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  final int? id;
  final String? efullname;
  final String? eemail;
  final int? ephone;
  final bool edit;
  const AddContactScreen(
      {super.key,
      this.id,
      this.efullname,
      this.eemail,
      this.ephone,
      this.edit = false});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  @override
  Widget build(BuildContext context) {
    List<String>? fullname = widget.efullname?.split(' ');
    final firstname =
        TextEditingController(text: widget.edit ? fullname![0] : '');
    final lastname =
        TextEditingController(text: widget.edit ? fullname![1] : '');
    final phone = TextEditingController(
        text: widget.edit ? widget.ephone.toString() : '');
    final email = TextEditingController(text: widget.edit ? widget.eemail : '');

    var indedx = contactlist.length;

    addContact() {
      contactlist.add(Contact(
          id: indedx++,
          firstname: firstname.text,
          lastname: lastname.text,
          phone: int.parse(phone.text),
          email: email.text));
      Navigator.of(context).pop();
    }

    editContact(int? id) {
      var update = contactlist.firstWhere((element) => element.id == id);
      setState(() {
        update.id = widget.id;
        update.firstname = firstname.text;
        update.lastname = lastname.text;
        update.email = email.text;
        update.phone = int.parse(phone.text);
        Navigator.of(context).pop();
      });
    }

    return Scaffold(
      appBar:
          AppBar(title: Text(widget.edit ? 'Edit Contact' : 'Add'), actions: [
        IconButton(
            onPressed: widget.edit
                ? () {
                    editContact(widget.id);
                  }
                : addContact,
            icon: const Icon(Icons.done))
      ]),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black26,
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Positioned(
                          right: 2,
                          bottom: 2,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Icon(
                                Icons.add,
                                size: 15,
                              )))
                    ],
                  ),
                ),
              ),
              TextFieldwithTitle(
                  title: 'First name', hint: 'Prince', controller: firstname),
              TextFieldwithTitle(
                  title: 'Last name', hint: 'Dobariya', controller: lastname),
              TextFieldwithTitle(
                  title: 'Phone number',
                  hint: '+91 9876543210',
                  controller: phone),
              TextFieldwithTitle(
                  title: 'Email', hint: 'abc@gmail.com', controller: email)
            ],
          ),
        ),
      ),
    );
  }
}
