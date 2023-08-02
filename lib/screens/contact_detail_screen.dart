import 'dart:io';

import 'package:contact_diary/contact_list.dart';
import 'package:contact_diary/model/contact.dart';
import 'package:contact_diary/routes.dart';
import 'package:contact_diary/utils/utils.dart';
import 'package:contact_diary/widgets/icon_container.dart';
import 'package:flutter/material.dart';

class ContactDetailScreen extends StatefulWidget {
  String? fullname;
  String? email;
  String? phone;
  String? image;
  int? index;
  ContactDetailScreen(
      {super.key,
      required this.fullname,
      required this.email,
      required this.phone,
      this.image,
      required this.index
      });

  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  @override
  Widget build(BuildContext context) {
    void deleteContact(String? phone) {
      setState(() {
        contactlist.removeWhere((element) => element.phone == phone);
      });
      Navigator.of(context).pop();
    }

    String phone = widget.phone??'';
    String firstLetter = widget.fullname!.substring(0,1);
    String secondLetter = widget.fullname!.split(' ').last.substring(0,1);

    return Scaffold(
      appBar: AppBar(title: Text('Contact ${widget.index}')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 150,
                child: Stack(children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: widget.image != null
                        ? CircleAvatar(
                            radius: 40,
                            backgroundImage: FileImage(File('${widget.image}')),
                          )
                        : CircleAvatar(
                            radius: 40,
                            child: Text(firstLetter + secondLetter),
                          ),
                  ),
                  Positioned(
                      bottom: -10,
                      right: 0,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                deleteContact(widget.phone);
                              },
                              icon: const Icon(Icons.delete)),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(addeditRoute, arguments: {
                                  'efullname': widget.fullname,
                                  'eemail': widget.email,
                                  'ephone': widget.phone,
                                  'eimage': widget.image,
                                  'index': widget.index
                                }).then((value) {
                                  setState(() {
                                    if (value == null) {
                                      return;
                                    }
                                    Contact data = value as Contact;
                                    widget.fullname = '${data.firstname} ${data.lastname}';
                                    widget.phone = data.phone;
                                    widget.email = data.email;
                                    widget.image = data.image;
                                  });
                                });
                              },
                              icon: const Icon(Icons.edit))
                        ],
                      ))
                ]),
              ),
              const SizedBox(height: 20),
              Text(
                widget.fullname??'',
                style:
                    const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(phone,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.black, height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconContainer(
                    color: Colors.green,
                    icon: Icons.call,
                    ontap: () {
                      call(widget.phone);
                    },
                  ),
                  IconContainer(
                    color: Colors.deepOrange,
                    icon: Icons.message,
                    ontap: () {
                      message(widget.phone);
                    },
                  ),
                  IconContainer(
                    color: Colors.blue,
                    icon: Icons.mail,
                    ontap: () {
                      mail(widget.email);
                    },
                  ),
                  IconContainer(
                    color: Colors.orange,
                    icon: Icons.share_outlined,
                    ontap: () {
                      share(widget.fullname,widget.phone);
                    },
                  )
                ],
              ),
              const Divider(color: Colors.black, height: 1)
            ],
          ),
        ),
      ),
    );
  }
}
