import 'package:contact_diary/contact_list.dart';
import 'package:contact_diary/routes.dart';
import 'package:flutter/material.dart';

class ContactDetailScreen extends StatefulWidget {
  final int? id;
  final String fullname;
  final String email;
  final int phone;
  const ContactDetailScreen(
      {super.key,
      this.id,
      required this.fullname,
      required this.email,
      required this.phone});

  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  @override
  Widget build(BuildContext context) {
    void deleteContact(int phone) {
      setState(() {
        contactlist.removeWhere((element) => element.phone == phone);
      });
      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Stack(children: [
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.black26,
                      child: Icon(Icons.person, size: 50)),
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
                                'id': widget.id,
                                'efullname': widget.fullname,
                                'eemail': widget.email,
                                'ephone': widget.phone,
                                'edit': true
                              }).then((value) {
                                Navigator.of(context).pop();
                              });
                            },
                            icon: const Icon(Icons.edit))
                      ],
                    ))
              ]),
            ),
            const SizedBox(height: 20),
            Text(
              widget.fullname,
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(widget.phone.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.black, thickness: 0.6),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconContainer(color: Colors.green, icon: Icons.call),
                IconContainer(color: Colors.deepOrange, icon: Icons.message),
                IconContainer(color: Colors.blue, icon: Icons.mail),
                IconContainer(color: Colors.orange, icon: Icons.share_outlined)
              ],
            ),
            const Divider(color: Colors.black, thickness: 0.6)
          ],
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final Color color;
  final IconData icon;
  const IconContainer({
    required this.color,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 40,
      width: 40,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Icon(icon, color: Colors.white),
    );
  }
}
