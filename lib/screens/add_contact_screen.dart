import 'dart:io';

import 'package:contact_diary/contact_list.dart';
import 'package:contact_diary/model/contact.dart';
import 'package:contact_diary/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddContactScreen extends StatefulWidget {
  String? efullname;
  String? eemail;
  String? ephone;
  String? eimage;
  int? index;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  String? image;
  AddContactScreen(
      {super.key,
      this.efullname,
      this.eemail,
      this.ephone,
      this.eimage,
      this.index}) {
    if (index != null) {
      image = eimage;
      List<String>? fullname = efullname?.split(' ');
      firstname = TextEditingController(text: fullname?[0]);
      lastname = TextEditingController(text: fullname?[1]);
      phone = TextEditingController(text: ephone);
      email = TextEditingController(text: eemail);
    }
  }
  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  // String? image;

  Future<void> pickImage() async {
    XFile? picker = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      widget.image = picker!.path;
    });
  }

  addEditContact() {
    Contact userData = Contact(
        firstname: widget.firstname.text.trim(),
        lastname: widget.lastname.text.trim(),
        phone: widget.phone.text,
        email: widget.email.text,
        image: widget.image);
    if (widget.index == null) {
      contactlist.add(userData);
    } else {
      setState(() {
        contactlist[widget.index!] = userData;
      });
    }
    Navigator.pop(context, userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.index != null ? 'Edit Contact' : 'Add Contact'),
          actions: [
            IconButton(onPressed: addEditContact, icon: const Icon(Icons.done))
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
                      widget.image != null
                          ? CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  FileImage(File('${widget.image}')))
                          : const CircleAvatar(
                              radius: 30,
                              child: Text('Add'),
                            ),
                      Positioned(
                          right: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: pickImage,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Icon(
                                  Icons.photo_camera,
                                  size: 20,
                                )),
                          ))
                    ],
                  ),
                ),
              ),
              TextFieldwithTitle(
                  title: 'First name',
                  hint: 'Prince',
                  controller: widget.firstname),
              TextFieldwithTitle(
                  title: 'Last name',
                  hint: 'Dobariya',
                  controller: widget.lastname),
              TextFieldwithTitle(
                  title: 'Phone number',
                  hint: '+91 9876543210',
                  controller: widget.phone),
              TextFieldwithTitle(
                  title: 'Email',
                  hint: 'abc@gmail.com',
                  controller: widget.email)
            ],
          ),
        ),
      ),
    );
  }
}
