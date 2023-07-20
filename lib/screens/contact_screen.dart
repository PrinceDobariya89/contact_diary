import 'package:contact_diary/contact_list.dart';
import 'package:contact_diary/main.dart';
import 'package:contact_diary/routes.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key, this.dark});
  final Function(bool)? dark;
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  // widget.dark;
                  // MyApp.of(context).changeTheme(ThemeMode.dark);
                });
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
        onPressed: () {
           Navigator.of(context).pushNamed(addeditRoute).then((value){setState(() {
           });});
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
        int phone = contactlist[index].phone;
        String email = contactlist[index].email;
        int? id = contactlist[index].id;
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(fullname),
          subtitle: Text(phone.toString()),
          trailing: IconButton(
              icon: const Icon(Icons.call, color: Colors.green),
              onPressed: () {}),
          onTap: () {
            Navigator.of(context).pushNamed(contactsDetailRoute,
                arguments: {
                  'id': id,
                  'fullname': fullname,
                  'phone': phone,
                  'email': email
                }).then((value){setState(() {
                  
                });});
          },
        );
      },
    );
  }

  Center noContactFound() {
    return  const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.no_accounts_outlined, size: 50),
          Text('You have no contact yet')
        ],
      ),
    );
  }
}
