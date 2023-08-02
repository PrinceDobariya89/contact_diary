import 'dart:io';

import 'package:contact_diary/contact_list.dart';
import 'package:contact_diary/model/contact.dart';
import 'package:contact_diary/routes.dart';
import 'package:contact_diary/utils/utils.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact> contacts = contactlist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
              onPressed: () {
              },
              icon: Icon(
                Icons.circle,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              )),
          const Icon(Icons.more_vert),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: contactlist.isEmpty ? noContactFound() : contactList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Contact',
        onPressed: () {
          Navigator.of(context).pushNamed(addeditRoute).then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView contactList() {
    return ListView.builder(
      itemCount: contactlist.length,
      itemBuilder: (context, index) {
        String fullname =
            '${contactlist[index].firstname} ${contactlist[index].lastname}';
        String phone = contactlist[index].phone;
        String email = contactlist[index].email;
        String? image = contactlist[index].image;
        String imagetext =
            contactlist[index].firstname.substring(0,1) + contactlist[index].lastname.substring(0,1);
        return ListTile(
          leading: image != null
              ? CircleAvatar(backgroundImage: FileImage((File(image))))
              : CircleAvatar(backgroundColor: Colors.white,child: Text(imagetext),),
          title: Text(fullname),
          subtitle: Text(phone),
          trailing: IconButton(
              icon: const Icon(Icons.call, color: Colors.green),
              onPressed: () {
                call(phone.toString());
              }),
          onTap: () {
            Navigator.of(context).pushNamed(contactsDetailRoute, arguments: {
              'fullname': fullname,
              'phone': phone,
              'email': email,
              'image': image,
              'index': index
            }).then((value) {
              setState(() {});
            });
          },
        );
      },
    );
  }

  Center noContactFound() => const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.no_accounts_outlined, size: 50),
            Text('You have no contact yet')
          ],
        ),
      );
}
