import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    const tiltle = ["Họ và Tên", "Giới tính", "Email", "Số điệnh thoại"];
    const datas = [
      "Phan Kieu Phu",
      "Nam",
      "phankieuphu@gmial.com",
      "0799992551"
    ];
    // TODO: implement build
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        // overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              height: screenSize.height * 0.2 + 150,
              width: screenSize.width,
              color: Color.fromRGBO(43, 49, 109, 1.0),
            ),
          ),
          Positioned(
              left: 20,
              top: -25,
              child: Image.asset('/gerdali.json', height: 400, width: 400)),
          Positioned(
            top: screenSize.height * 0.2 + 20,
            bottom: -screenSize.height,
            right: 0.0,
            left: 0.0,
            child: Container(
              height: screenSize.height - (screenSize.height * 0.2 + 20),
              width: screenSize.width,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80.0),
                      topRight: Radius.circular(80.0))),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: screenSize.height - (screenSize.height * 0.2 + 70),
                    width: screenSize.width,
                    child: ListView.separated(
                        padding:
                            EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
                        itemBuilder: (context, index) {
                          return TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0))),
                          );
                        },
                        separatorBuilder: (BuildContext, int index) {
                          return SizedBox(
                            height: 10.0,
                          );
                        },
                        itemCount: 10),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.2 - 60,
            left: screenSize.width / 2 - 75,
            child: RawMaterialButton(
              padding: EdgeInsets.all(40.0),
              fillColor: Colors.white,
              shape: CircleBorder(
                  side: BorderSide(color: Colors.black, width: 1.0)),
              elevation: 0.0,
              child: Icon(
                Icons.camera_alt,
                color: Colors.grey,
                size: 70.0,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

// Container(
//   width: 500,
//   height: 250,
//   color: Colors.red,
//   child: Center(
//     child: CircleAvatar(
//       backgroundImage:
//           NetworkImage("https://bom.to/WnQXngMERsm0U9"),
//       radius: 80,
//       backgroundColor: Colors.blue,
//     ),
//   ),
// ),

//     child: ListView(
//   padding: const EdgeInsets.all(8),
//   children: <Widget>[
//     Container(
//       color: Colors.yellow,
//       height: 50,
//       child: Column(children: <Widget>[
//         Text("AVC"),
//         Text("AHAf"),
//       ]),
//     ),
//   ],
// )),

class HeaderProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: 500,
      height: 250,
      color: Colors.red,
      child: Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://bom.to/WnQXngMERsm0U9"),
          radius: 80,
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}

class BottomProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('Entry A')),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}
