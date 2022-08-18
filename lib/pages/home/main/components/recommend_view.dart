import 'package:flutter/material.dart';
import 'package:kreader/pages/components/book.dart';

class RecommendView extends StatelessWidget {
  final String title;
  final List<Book> data;
  final Function onTap;

  const RecommendView({Key? key, required this.title, required this.data, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width/data.length/0.75,
          child: ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: _cellForRow,
          ),
        ),
      ],
    );
  }

  Widget _cellForRow(BuildContext context, int index) {
    final size =MediaQuery.of(context).size;
    var width=size.width/data.length;
    return InkWell(
      onTap: (){
        onTap(index);
      },
      child: SizedBox(
        width: width,
        height: width/0.75,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              children: <Widget>[
                Image.network(data[index].imageUrl,fit: BoxFit.cover,),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  data[index].bookName,
                  style: const TextStyle(fontSize: 18.0,),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

}
