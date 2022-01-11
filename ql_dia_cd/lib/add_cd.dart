import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCD extends StatefulWidget {

  const AddCD({Key? key}) : super(key: key);

  @override
  _AddCDState createState() => _AddCDState();
}

class _AddCDState extends State<AddCD> {

  var fkey = GlobalKey<FormState>();

  var txtTenDia = TextEditingController();
  var txtThoiLuong = TextEditingController();
  var txtSoLuong = TextEditingController();
  var txtGiaBan = TextEditingController();
  var txtTheLoai = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Thêm đĩa CD"),),
        leading: ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Form(
        key: fkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                controller: txtTenDia,
                decoration: const InputDecoration(
                    hintText: "Nhập tên đĩa",
                    labelText: "Tên đĩa"
                ),
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return "Vui lòng nhập tên đĩa!";
                  }
                },
              ),
              TextFormField(
                controller: txtTheLoai,
                decoration: const InputDecoration(
                  hintText: "Nhập tên thể loại",
                    labelText: 'Thể loại'
                ),
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return "Vui lòng nhập thể loại!";
                  }
                },
              ),
              TextFormField(
                controller: txtThoiLuong,
                decoration: const InputDecoration(
                  hintText: "Nhập thời lượng",
                    labelText: 'Thời lượng (phút)'
                ),
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return "Vui lòng nhập thời lượng!";
                  }
                },
              ),
              TextFormField(
                controller: txtSoLuong,
                decoration: const InputDecoration(
                  hintText: "Nhập số lượng",
                    labelText: 'Số lượng'
                ),
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return "Vui lòng nhập số lượng!";
                  }
                },
              ),
              TextFormField(
                controller: txtGiaBan,
                decoration: const InputDecoration(
                  hintText: "Nhập giá bán",
                    labelText: 'Giá bán (VND)'
                ),
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return "Vui lòng nhập giá bán!";
                  }
                },
              ),
              ElevatedButton(
                  onPressed: (){
                    if(fkey.currentState!.validate())
                    {
                      var tenDia = txtTenDia.text;
                      var theLoai = txtTheLoai.text;
                      var thoiLuong = txtThoiLuong.text;
                      var soLuong = txtSoLuong.text;
                      var giaBan = txtGiaBan.text;
                      showDialog(
                          context: context,
                          builder: (context)
                          {
                            return AlertDialog(
                              title: Text("Thông báo"),
                              content: Text("Thêm đĩa CD thành công!"),
                            );
                          }
                      );
                    }
                  },
                  child: Text("Thêm đĩa CD")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
