import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});
  static const String id = 'contacts page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: white,
        ),
        backgroundColor: beforeDarkPurple,
        centerTitle: true,
        title: const Text(
          'My Contacts',
          style: TextStyle(
            color: white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: softGray,
      body: ListView(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Icon(
                  Icons.star,
                  color: Colors.blueGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Favourites',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: [

                ],
              ),
            ),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Icon(
                  Icons.contact_page,
                  color: Colors.blueGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'All',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
