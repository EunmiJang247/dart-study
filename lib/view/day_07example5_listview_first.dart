import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/message.dart';
import 'package:second_flutter_pract/model/todo_list.dart';
import 'package:second_flutter_pract/view/day_07example5_detaillistview_third.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  //모델 프로퍼티 선언
  late List<TodoList> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    addData();
  }

  addData() {
    todoList.add(TodoList(
        imagePath: "images/cart.png",
        workList: "책구매",
        listColor: Colors.amber));
    todoList.add(TodoList(
        imagePath: "images/clock.png",
        workList: "철수와약속",
        listColor: Colors.amber));
    todoList.add(TodoList(
        imagePath: "images/pencil.png",
        workList: "스터디 준비하기",
        listColor: Colors.amber));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main View'),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/insert')
                  .then((value) => rebuildData()),
              // 두번째 화면에서 핑 오면 여기서부터 시작이야.
              icon: Icon(Icons.plus_one_rounded),
            )
          ],
        ),
        body: Center(
          child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.endToStart, //오른쪽에서 왼쪽으로 밀때
                  key: ValueKey(todoList[index]), //인덱스 번호 보내면돼
                  onDismissed: (direction) {
                    todoList.remove(todoList[index]);
                    setState(() {});
                  }, //밀었다
                  background: Container(
                      color: Colors.red,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete_forever,
                            size: 50,
                          ),
                          Text('삭제')
                        ],
                      )),
                  child: GestureDetector(
                    onTap: () {
                      Message.workList = todoList[index].workList;
                      Message.imagePath = todoList[index].imagePath;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DetailList()), //디테일 화면으로 가라
                      );
                      // .then((value) => rebuildCardColor(index));
                    },
                    child: Card(
                      color: todoList[index].listColor,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Image.asset(
                              todoList[index].imagePath,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Text(" ${todoList[index].workList}")
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }

  rebuildData() {
    if (Message.action) {
      todoList.add(TodoList(
          imagePath: Message.imagePath,
          workList: Message.workList,
          listColor: Colors.amber));
    }
    Message.action = false;
    setState(() {});
  }

  // rebuildCardColor(index) {
  //   todoList[index].listColor = Colors.green;
  //   todoList[index].imagePath = 'images/pikachu-1.jpg';
  //   setState(() {});
  // }
}
