import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

import 'package:hello/backend/Package.dart';

class DataBase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String getcurrentuser() {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;
    return uid;
    print(uid);
  }

  addPackage(
      String destination,
      String dimensions,
      DateTime finalDate,
      double insurance,
      String status,
      String type,
      double weight,
      double payment,
      String Receiver_Id) {
    if (status == "") {
      status = "In_Transit";
    }

    if (type == "") {
      type = "Regular";
    }

    firestore
        .collection("Package")
        .add({
          'Sender_Id': getcurrentuser(),
          'Final_delivery_Date': finalDate,
          'Weight': weight,
          'Insurance_Amount': insurance,
          'Dimensions': dimensions,
          'Destination': destination,
          'Type': type,
          'Status': status,
          'Payment': payment,
          'Receiver_Id': Receiver_Id,
          "Sent_Date": DateTime.now()
        })
        .then((value) => print("Package Added"))
        .catchError((error) => print("Failed to add Package: $error"));
  }

  editPackage(String doc, String key, var value) {
    CollectionReference package = firestore.collection('Package');

    package
        .doc(doc)
        .update({key: value})
        .then((value) => print("Package Updated"))
        .catchError((error) => print("Failed to update Package: $error"));
  }

  deletePackage(String doc) {
    CollectionReference package = firestore.collection('Package');

    package
        .doc(doc)
        .delete()
        .then((value) => print("package Deleted"))
        .catchError((error) => print("Failed to delete package: $error"));
  }

  addCustomer(String name, String location, String email, String password) {
    // Call the user's CollectionReference to add a new user

    firestore
        .collection("Customer")
        .add({
          'Name': name,
          'Location': location,
          "Email": email,
          'Password': password
        })
        .then((value) => print("Customer Added"))
        .catchError((error) => print("Failed to add Customer: $error"));
  }

  editCustomer(String doc, String key, var value) {
    CollectionReference customer = firestore.collection('Customer');

    customer
        .doc(doc)
        .update({key: value})
        .then((value) => print("customer Updated"))
        .catchError((error) => print("Failed to update customer: $error"));
  }

  deleteCustomer(String doc) {
    CollectionReference Customer = firestore.collection('customer');

    Customer.doc(doc)
        .delete()
        .then((value) => print("Customer Deleted"))
        .catchError((error) => print("Failed to delete Customer: $error"));
  }

  Future<List<Package>> getSentCustomerPackages(String id) async {
    List<Package> CusPackages = [];

    await firestore
        .collection('Package')
        .where("Sender_Id", isEqualTo: id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        CusPackages.add(new Package(
            doc["Sender_Id"],
            doc["Destination"],
            doc["Dimensions"],
            doc['Final_delivery_Date'].toDate(),
            doc['Insurance_Amount'],
            doc['Status'],
            doc['Type'],
            doc['Weight'],
            doc['Payment'],
            doc['Receiver_Id'],
            doc['Sent_Date'].toDate()));
      });
    });

    return CusPackages;
  }

  Future<List<Package>> getReceivedCustomerPackages(String id) async {
    List<Package> CusPackages = [];

    await firestore
        .collection('Package')
        .where("Receiver_Id", isEqualTo: id)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        CusPackages.add(new Package(
            doc["Sender_Id"],
            doc["Destination"],
            doc["Dimensions"],
            doc['Final_delivery_Date'].toDate(),
            doc['Insurance_Amount'],
            doc['Status'],
            doc['Type'],
            doc['Weight'],
            doc['Payment'],
            doc['Receiver_Id'],
            doc['Sent_Date'].toDate()));
      });
    });

    return CusPackages;
  }

  getAllCustomerPackages(String id) async {
    return await getSentCustomerPackages(id) +
        await getReceivedCustomerPackages(id);
  }

  Future<int> getTotalPackagesNum(DateTime start, DateTime end) async {
    int totalPackages = 0;
    await firestore
        .collection('Package')
        .where("Sent_Date", isGreaterThan: start)
        .where("Sent_Date", isLessThan: end)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        totalPackages += 1;
      });
    });

    return totalPackages;
  }

  Future<List<Package>> getBasedOn(
      String type, String location, String status) async {
    List<Package> CusPackages = [];

    await firestore
        .collection('Package')
        .where("Sender_Id", isEqualTo: type)
        .where("Status", isEqualTo: status)
        .where("Destination", isEqualTo: location)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        CusPackages.add(new Package(
            doc["Sender_Id"],
            doc["Destination"],
            doc["Dimensions"],
            doc['Final_delivery_Date'].toDate(),
            doc['Insurance_Amount'],
            doc['Status'],
            doc['Type'],
            doc['Weight'],
            doc['Payment'],
            doc['Receiver_Id'],
            doc['Sent_Date'].toDate()));
      });
    });

    return CusPackages;
  }

  Future<List<Package>> getLDD(DateTime start, DateTime end) async {
    List<Package> CusPackages = [];

    await firestore
        .collection('Package')
        .where("Sent_Date", isGreaterThan: start)
        .where("Sent_Date", isLessThan: end)
        .where("Status", whereIn: ['Lost', 'Delayed', 'Deliverd'])
        .get()
        .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            CusPackages.add(new Package(
                doc["Sender_Id"],
                doc["Destination"],
                doc["Dimensions"],
                doc['Final_delivery_Date'].toDate(),
                doc['Insurance_Amount'],
                doc['Status'],
                doc['Type'],
                doc['Weight'],
                doc['Payment'],
                doc['Receiver_Id'],
                doc['Sent_Date'].toDate()));
          });
        });

    return CusPackages;
  }

  //0= no account , 1=customer ,2=employee
  // Login(String email,String password) async {
  //   int isUser = 0;
  //   await firestore
  //       .collection("Employee")
  //       .where('Email', isEqualTo: email)
  //       .where('Password', isEqualTo: password)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       isUser = 2;
  //     });
  //   });

  //   await firestore
  //       .collection("Customer")
  //       .where('Email', isEqualTo: email)
  //       .where('Password', isEqualTo: password)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       isUser = 1;
  //     });
  //   });

  //   return isUser;
  // }

  Future signIn(String email, String password) async {
    try {
      var myUser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('Found user');
      return myUser;
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future signUp(
      String email, String password, String name, String location) async {
    try {
      var myUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((registeredUser) => firestore.collection('Customer').add({
                'uid': registeredUser.user!.uid,
                'Email': email,
                'Name': name,
                'Location': location,
              }));
      // await myUser.user?.
      print((myUser.runtimeType));

      return myUser;
    } on FirebaseAuthException catch (e) {
      print(e);
      return "error";
    }
  }
}
