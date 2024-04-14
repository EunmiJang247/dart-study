import 'package:flutter/material.dart';
import 'package:second_flutter_pract/model/animal_list.dart';

class ListViewSecondFirstPage extends StatefulWidget {
  final List<AnimalList> list;
  const ListViewSecondFirstPage({super.key, required this.list});

  @override
  State<ListViewSecondFirstPage> createState() =>
      _ListViewSecondFirstPageState();
}

class _ListViewSecondFirstPageState extends State<ListViewSecondFirstPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return Dismissible(
              direction: DismissDirection.endToStart,
              key: ValueKey(widget.list[index]),
              onDismissed: (direction) {
                widget.list.remove(widget.list[index]);
                setState(() {});
              },
              background: Container(
                  // 칼라를 주려고 콘테이너를 쓴다
                  color: Colors.green,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete_forever, size: 50, color: Colors.white),
                      Text('삭제',
                          style: TextStyle(fontSize: 20, color: Colors.white))
                    ],
                  )),
              child: GestureDetector(
                onTap: () {
                  _popUpShow(index, context);
                },
                child: Card(
                    // 카드 앞에 return필수!!!
                    child: Row(
                  children: [
                    Image.asset(
                      widget.list[index].imagePath,
                      width: 100,
                      height: 100,
                    ),
                    Text(
                      "      ${widget.list[index].name}",
                    )
                  ],
                )),
              ),
            );
          }),
    ));
  }

  _popUpShow(index, context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // 조정할 AlertDialog의 테두리 둥근 정도
            ),
            title: Text(
              widget.list[index].name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: Text(
                '종류는: ${widget.list[index].species}\n특징은: ${widget.list[index].flyExist}',
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal)),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  //of를 붙여야 가장 위 콘텍스트를 지우게 된다
                },
                style: TextButton.styleFrom(
                    minimumSize: Size(80, 40),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: const Text('확인'),
              ),
            ],
          );
        });
  }
}
