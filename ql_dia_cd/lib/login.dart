
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ql_dia_cd/dang_ky.dart';
import 'package:ql_dia_cd/home.dart';

class MyApp5 extends StatelessWidget {
  const MyApp5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormBasic(),
    );
  }
}
class FormBasic extends StatefulWidget {
  const FormBasic({Key? key}) : super(key: key);

  @override
  _FormBasicState createState() => _FormBasicState();
}

class _FormBasicState extends State<FormBasic> {

  var fkey = GlobalKey<FormState>();

  var txtUsername = TextEditingController();
  var txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.music_note),
        title: Text("Đăng nhập hệ thống"),
      ),
      body: Container(
        height: 300.0,
        child: Form(
          key: fkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                SizedBox(height: 50,),
                TextFormField(
                  controller: txtUsername,
                  validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Vui lòng nhập username";
                    }
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "Username",
                    labelText: "Tên đăng nhập(*)",
                  ),
                ),
                TextFormField(
                  controller: txtPassword,
                  obscureText: true,
                  validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Vui lòng nhập password";
                    }
                    else
                    if(value.length<6)
                      return "Mật khẩu ít nhất 6 ký tự";
                    else
                      return null;
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: "Password",
                    labelText: "Mật khẩu(*)",
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    if(fkey.currentState!.validate())
                    {
                      String username = txtUsername.text;
                      String password = txtPassword.text;
                      if(username.compareTo('admin')==0)
                      {
                        Navigator.push(
                                context,
                            MaterialPageRoute(builder: (context) => Home(),)
                        );
                      }
                    }
                    else
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Thông báo"),
                          content: Text('Tài khoản hoặc mật khẩu không đúng!'),
                        );
                      }
                      );
                  },
                  child: Text("Đăng nhập"),
                ),
                TextButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyBT1(),)
                      );
                    },
                    child: Text('Đăng ký tài khoản')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

