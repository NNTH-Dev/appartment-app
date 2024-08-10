import 'package:appartmentapp/Screens/NavigationBar/navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'package:appartmentapp/Screens/Login/Component/qr_scanner_code.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

var controllerLoginCode = TextEditingController();

class AcountLogin {
  final String userLogin;
  const AcountLogin(this.userLogin);
}

class _LoginScreenState extends State<LoginScreen> {
  List<AcountLogin> username = <AcountLogin>[
    const AcountLogin("admin"),
    const AcountLogin("Phu"),
    const AcountLogin("Hao"),
    const AcountLogin("Nam"),
    const AcountLogin("Minh"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        maxHeight: size.height,
        maxWidth: size.width,
      ),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          containerLogoApp(size),
          containerLoginComponent(size),
        ],
      ),
    );
  }

  Widget containerLogoApp(size) => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo.shade700,
                Colors.indigo.shade700,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80))),
        child: SizedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                height: size.height * 0.4,
                child: Image.asset(
                  "assets/images/logoapp.png",
                  width: size.width * 0.5,
                ),
              ),
            ],
          ),
          height: size.height * 0.3,
        ),
      );

  Widget containerLoginComponent(size) => Container(
        height: size.height * 0.7,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: functionLogin(context),
          ),
        ),
      );

  Widget functionLogin(context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          titileLogin(),
          const SizedBox(
            height: 30,
          ),
          inputCodeLogin(context),
          const SizedBox(height: 120),
          ButtonLogin(context),
        ],
      );

  Widget titileLogin() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            "ĐĂNG NHẬP",
            style: TextStyle(
              // fontFamily: 'Raleway',
              color: Colors.indigo,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              // fontFamily: "RobotoMono"
            ),
            textAlign: TextAlign.start,
          ),
        ],
      );

  Widget inputCodeLogin(context) => Material(
        borderRadius: BorderRadius.circular(30),
        child: TextField(
          controller: controllerLoginCode,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            ),
            fillColor: Colors.grey.shade300,
            filled: true,
            hintText: "Nhập mã xác nhận",
            prefixIcon: Icon(
              Icons.code_rounded,
              color: Colors.greenAccent.shade400,
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.qr_code),
              iconSize: 30,
              color: Colors.indigo.shade700,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QrScanner()));
              },
            ),
          ),
        ),
      );

  Widget ButtonLogin(context) => Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.width * 0.13,
        child: ElevatedButton(
          onPressed: () {
            if (controllerLoginCode.text == "admin1234") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationB()));
              controllerLoginCode.text = "";
            } else if (controllerLoginCode.text == "" ||
                controllerLoginCode.text == null) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text("Vui lòng nhập mã xác nhận !!!"),
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text("Nhập sai mã xác nhận !!!"),
                    );
                  });
              controllerLoginCode.text = "";
            }
          },
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          // padding: const EdgeInsets.all(0.0) ,
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.greenAccent.shade400,
                  Colors.greenAccent.shade200,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(80.0)),
            ),
            child: Container(
              constraints:
                  const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
              alignment: Alignment.center,
              child: const Text(
                'Xác nhận',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
}
