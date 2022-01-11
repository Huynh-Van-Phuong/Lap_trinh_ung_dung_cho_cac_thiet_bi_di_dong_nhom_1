import 'package:flutter/material.dart';
import 'package:ql_dia_cd/cd.dart';
import 'cd.dart';

class Edit extends StatelessWidget {

  final Cd c;

  const Edit({Key? key, required this.c}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fkey = GlobalKey<FormState>();

    var txtTenDia = TextEditingController();
    var txtThoiLuong = TextEditingController();
    var txtSoLuong = TextEditingController();
    var txtGiaBan = TextEditingController();
    var txtTheLoai = TextEditingController();

    txtTenDia.text = c.tenDia;
    txtThoiLuong.text = c.thoiLuong.toString()+' phút';
    txtSoLuong.text = c.soLuong.toString();
    txtGiaBan.text = c.giaBan.toString();

    switch(c.theLoai)
    {
      case 1:{
        txtTheLoai.text = 'Nhạc đỏ';
        break;
      }
      case 2:{
        txtTheLoai.text = 'Nhạc trẻ';
        break;
      }
      case 3:{
        txtTheLoai.text = 'KARAOKE';
        break;
      }
      case 4:{
        txtTheLoai.text = 'Phim';
        break;
      }
      case 5:{
        txtTheLoai.text = 'Hoạt hình';
        break;
      }
      case 6:{
        txtTheLoai.text = 'Thể thao mạo hiểm';
        break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Sửa thông tin đĩa CD"),),
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
                              content: Text("Cập nhật thành công!"),
                            );
                          }
                      );
                    }
                  },
                  child: Text("Cập nhật")
              ),
            ],
          ),
        ),
      ),
    );
  }
}

