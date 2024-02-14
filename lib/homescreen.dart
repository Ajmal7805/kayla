import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {


  

  Future<void> _launchUrl({required int contactno}) async {
    final Uri _url = Uri.parse('http://wa.me/91$contactno');

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          'kayla connect',
          style: TextStyle(fontFamily: 'Syne'),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          builder(name: 'AJMAL', contactno: 9778783086, images: 'images/1.jpg'),
          builder(
              name: 'JISHNU SIR', contactno: 8848601460, images: 'images/2.jpg'),
          SizedBox(
            height: 5,
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.restore_outlined,
                color: Colors.blue,
              ),
              title: Text(
                "KAN's Hub,Wandoor",
                style:
                    TextStyle(color: Colors.black, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
      ),
    );

  }

  Widget builder({
    required String name,
    required int contactno,
    required String images
  }) {
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.teal[300],
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(radius: 30, backgroundImage: AssetImage('$images')),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  'Name:',
                  style: TextStyle(color: Colors.white),
                )),
                Text(
                  name,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 0.5,
              color: Colors.white,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  'CONTACT NO:',
                  style: TextStyle(color: Colors.white),
                )),
                InkWell(
                  onTap: () {
                    _launchUrl(contactno: contactno);
                  },
                  child:
                  
                  
                  
                   Text(
                    contactno.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }


}
