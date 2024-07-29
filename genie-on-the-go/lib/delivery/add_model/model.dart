class Person {
  final String name;
  final String address1;
  final String address2;
  final String pinCode;
  final String mobileNumber;
  final String emailId;
  final String city;

  Person({
    required this.name,
    required this.address1,
    required this.address2,
    required this.pinCode,
    required this.mobileNumber,
    required this.emailId,
    required this.city,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      address1: json['address1'],
      address2: json['address2'],
      pinCode: json['pin_code'],
      mobileNumber: json['mobile_number'],
      emailId: json['email_id'],
      city: json['city'],
    );
  }
}
