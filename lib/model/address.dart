class UserEx {
  final int id;
  final String name;
  final String email;
  final String username;
  // final String address;
  // final String street;
  // final String suite;
  // final String city;
  // final String zipcode;
  final String phone;
  final String website;

UserEx({
  required this.id,
  required this.name,
  required this.email,
  required this.username,
  // required this.address,
  // required this.street,
  // required this.suite,
  // required this.city,
  // required this.zipcode,
  required this.phone,
  required this.website,
  });

factory UserEx.fromJson(Map<String, dynamic> json) {
  return UserEx(
    id: json['id'],
    name: json['name'],
    email: json['email'],
      username: json['username'],
    // address: json['address'],
    //   street:json['street'],
      // suite:json['suite'],
      // city:json['city'],
      // zipcode:json['zipcode'],
      phone:json['phone'],
      website:json['website'],
  );
}
}
//
// username
// street
// suite
// city
// zipcode
// phone
// website