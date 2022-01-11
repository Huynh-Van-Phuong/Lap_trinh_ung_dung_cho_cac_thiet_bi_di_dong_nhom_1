import 'package:flutter/material.dart';
import 'package:ql_dia_cd/add_cd.dart';
import 'package:ql_dia_cd/edit_cd.dart';
import 'cd.dart';

class ListCD extends StatelessWidget {

  final int type;

  const ListCD({Key? key, required this.type, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Cd> ls = [];
    ls = Cd.getCd(type);
    return Scaffold(
      appBar: AppBar(
        title: const Card(
          child: ListTile(
            leading: Icon(Icons.search),
            title: TextField(
            decoration: InputDecoration(
            hintText: 'Search', border: InputBorder.none),
            // onChanged: onSearchTextChanged,
            ),
          ),
        ),
        leading: ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        child: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView.builder(
            itemCount: ls.length,
            itemBuilder: (BuildContext context, int index)
            {
              return Card(
                elevation: 0,
                child: ListTile(
                    title: Text(ls[index].tenDia),
                    leading: CircleAvatar(
                      child: Text((ls[index].maDia).toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.blueAccent,
                    ),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Edit(c: ls[index],),)
                              );
                            },
                            icon: Icon(Icons.edit)
                        ),
                        IconButton(
                            onPressed: (){
                              showDialog(
                                  context: context,
                                  builder: (context)
                                  {
                                    return AlertDialog(
                                      title: Text("Thông báo"),
                                      content: Container(
                                        width: 40.0,
                                        height: 50.0,
                                        child: Column(
                                          children: [
                                            Text('Bạn có thực sự muốn xóa'),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: (){

                                                    },
                                                    child: Text('Hủy')),
                                                ElevatedButton(
                                                    onPressed: (){

                                                    },
                                                    child: Text('OK')),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                              );
                        },
                            icon: Icon(Icons.delete)),
                      ],
                    )
                ),
              );
            },
          ),

      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.blue,
          child: Container(
            height: 50.0,
            child: Text(""),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        //thực hiện khi nhấn
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCD(),)
          );
        },
        child: Icon(Icons.add),
      ),
      //vị trí của floatingActionButton
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
