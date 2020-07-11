class User {
  int userID;
  String firstName;
  String lastName;

  User({this.userID, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    return data;
  }
}