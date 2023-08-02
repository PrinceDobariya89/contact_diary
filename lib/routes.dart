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
      return MaterialPageRoute(builder: (context) => const ContactScreen());
    case addeditRoute:
      return MaterialPageRoute(
          builder: (context) => args.isEmpty
              ? AddContactScreen()
              : AddContactScreen(
                  efullname: args['efullname'],
                  eemail: args['eemail'],
                  ephone: args['ephone'],
                  eimage: args['eimage'],
                  index: args['index'],
                ));
    case contactsDetailRoute:
      return MaterialPageRoute(
          builder: (context) => ContactDetailScreen(
                fullname: args['fullname'],
                email: args['email'],
                phone: args['phone'],
                image: args['image'],
                index: args['index'],
              ));
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Page Not Found...'),
          ),
        ),
      );
  }
}

const String contactsRoute = '/';
const String addeditRoute = '/add-update-contact';
const String contactsDetailRoute = '/contacts-detail';
