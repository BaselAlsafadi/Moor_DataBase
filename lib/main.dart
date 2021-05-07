import 'package:contact_honeybee/Database/moor_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Orders());
}

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Orders List"),
        ),
        body: SingleChildScrollView(child: NewOrder()),
      ),
    );
  }
}

class NewOrder extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  int isId;
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(hintText: ' Name'),
          keyboardType: TextInputType.text,
          controller: nameController,
        ),
        TextField(
          decoration: InputDecoration(hintText: 'number'),
          keyboardType: TextInputType.number,
          controller: numberController,
        ),
        RaisedButton(
          onPressed: () {
            isEdit
                ? setState(() {
                    AppDatabase().updateOrder(Contact(
                      id: isId,
                      name: nameController.text,
                      number: numberController.text,
                    ));
                    isEdit = false;
                    nameController.clear();
                    numberController.clear();
                  })
                : setState(() {
                    AppDatabase().insertContact(Contact(
                      name: nameController.text,
                      number: numberController.text,
                    ));
                    nameController.clear();
                    numberController.clear();
                  });
          },
          color: Colors.green,
          child: Text(isEdit ? "Edit Name" : "Save Name "),
        ),
        Container(
          height: 700,
          width: double.infinity,
          child: StreamBuilder(
            stream: AppDatabase().watchAllContact(),
            builder: (context, AsyncSnapshot<List<Contact>> snapshot) {
              return ListView.builder(
                physics: ScrollPhysics(),
                itemBuilder: (_, index) {
                  return Card(
                    color: Colors.orangeAccent,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        radius: 20,
                      ),
                      title: Text(snapshot.data[index].name),
                      subtitle: Text("Rs. ${snapshot.data[index].number}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              setState(() {
                                isId = snapshot.data[index].id;
                                nameController = TextEditingController(
                                    text: snapshot.data[index].name);
                                numberController = TextEditingController(
                                    text: snapshot.data[index].number);
                                isEdit = true;
                              });
                            },
                            color: Colors.red,
                          ),
                          SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.delete_outline),
                            onPressed: () {
                              setState(() {
                                AppDatabase().deleteOrder(snapshot.data[index]);
                              });
                            },
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
