import 'package:flutter/material.dart';

class User {
  String firstName;
  String lastName;

  User({
    @required this.firstName, 
    @required this.lastName
  });

  static List<User> getUsers() {
    return <User>[
      User(firstName: "Aaryan", lastName: "Shah"),
      User(firstName: "Ben", lastName: "John"),
      User(firstName: "Carrie fdfsdf", lastName: "Brown Deep"),
      User(firstName: "Deep", lastName: "Sen"),
      User(firstName: "Emily Richal Modrain", lastName: "Jane Aline"),
      User(firstName: "Ben", lastName: "John"),
      User(firstName: "Carrie", lastName: "Brown"),
      User(firstName: "Deep", lastName: "Sen Jane Aline"),
      User(firstName: "Emily", lastName: "Jane"),
      User(firstName: "Ben", lastName: "John"),
      User(firstName: "Carrie", lastName: "Brown"),
      User(firstName: "Deep", lastName: "Sen"),
      User(firstName: "Emily", lastName: "Jane"),
      User(firstName: "Ben", lastName: "John"),
      User(firstName: "Carrie", lastName: "Brown"),
      User(firstName: "Deep", lastName: "Sen Brown Aline"),
      User(firstName: "Emily", lastName: "Jane"),
      User(firstName: "Ben", lastName: "John"),
      User(firstName: "Carrie", lastName: "Brown"),
    ];
  }
}