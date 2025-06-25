import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Profile()
  ));
}


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker',
            style: TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.4
            ),),
          backgroundColor: Colors.lightBlue[700],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'User Profile',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 27
                            ),
                          ),
                          Icon(Icons.person, size: 100),
                        ],
                      )
                    ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        'Ivan Gabriel Talaoc',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        'ivangabriel.talaoc@g.bastate-u.edu.ph',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Company',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        'Batangas State University TNEU Balayan',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Number',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                      Text(
                        '09123456789',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(onPressed: (){}, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: Text('Logout')
                          ),
                        ],
                      ))
                    ],
                  ),
                )
              ]
          ),
        )
    );
  }
}
