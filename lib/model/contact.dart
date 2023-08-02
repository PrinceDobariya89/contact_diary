class Contact {
  String firstname;
  String lastname;
  String phone;
  String email;
  String? image;
  Contact(
      {required this.firstname,
      required this.lastname,
      required this.phone,
      required this.email,
      this.image});
}
