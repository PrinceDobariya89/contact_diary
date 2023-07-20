import 'package:contact_diary/screens/add_contact_screen.dart';
import 'package:contact_diary/screens/contact_detail_screen.dart';
import 'package:contact_diary/screens/contact_screen.dart';
import 'package:flutter/material.dart';

Route genrateRoute(RouteSettings settings) {
  Map args = {};
  if (settings.arguments != null) {
    args = settings.arguments as Map;
  }

  switch (settings.name) {
    case contactsRoute:
      return MaterialPageRoute(builder: (_) => const ContactScreen());
    case addeditRoute:
      return MaterialPageRoute(
          builder: (_) => args.isEmpty
              ? const AddContactScreen()
              : AddContactScreen(
                id: args['id'],
                  efullname: args['efullname'],
                  eemail: args['eemail'],
                  ephone: args['ephone'],
                  edit: args['edit'],
                ));
    case contactsDetailRoute:
      return MaterialPageRoute(
          builder: (_) => ContactDetailScreen(
              id: args['id'],
              fullname: args['fullname'],
              email: args['email'],
              phone: args['phone']));
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(body: Center(child: Text('Not Found'),),),
      );
  }
}

const String contactsRoute = '/';
const String addeditRoute = '/add-update-contact';
const String contactsDetailRoute = '/contacts-detail';