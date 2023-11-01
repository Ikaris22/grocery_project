class Address {
  final int? id;
  final String country;
  final String state;
  final String city;
  final String pincode;
  final String type;
   bool isCheck;
  Address({
    required this.id,
    required this.country,
    required this.state,
    required this.city,
    required this.pincode,
    required this.type,
     this.isCheck = false
  });
  Map<String, dynamic> toMapConvert() {
    return {
      'id': id,
      'country': country,
      'state': state,
      'city': city,
      'pincode': pincode,
      'type': type,
      'isCheck': isCheck ? 1 : 0,
    };
  }
}
