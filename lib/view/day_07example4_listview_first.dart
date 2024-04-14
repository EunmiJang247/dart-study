import 'package:flutter/material.dart';

class ListViewFirst extends StatefulWidget {
  const ListViewFirst({super.key});

  @override
  State<ListViewFirst> createState() => _ListViewFirstState();
}

class _ListViewFirstState extends State<ListViewFirst> {
  // Property
  // late List<int> todoList;
  late List<String> todoList;

  @override
  void initState() {
    super.initState();
    todoList = []; // 투두리스트 초기화

    addData();
  }

  addData() {
    // for (int i = 1; i <= 100; i++) {
    //   todoList.add(i);
    // }
    todoList.add('James');
    todoList.add('Judy');
    todoList.add('Jamy');
    todoList.add('Jabis');
    todoList.add('King');
    todoList.add('Kiwi');
    todoList.add('Kale');
    todoList.add('KKK');
    todoList.add('Kenny');
    todoList.add('James');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main View'),
      ),
      body: Center(
          child: todoList.isEmpty
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: todoList.length, //몇개만드는지 알려줌
                  itemBuilder: (context, index) {
                    // context 니까 쌓이겠지
                    // index : 카드의 index
                    return SizedBox(
                      height: 100,
                      child: Card(
                          color: index % 2 == 0 ? Colors.amber : Colors.red,
                          child: Center(
                            child: Text(
                              todoList[index].toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.blue),
                            ),
                          )),
                    );
                  },
                )),
    );
  }
}
