import 'package:flutter/material.dart';
import 'package:kreader/pages/search/components/search_book_result.dart';


class SearchResultView extends StatelessWidget{
  final List<SearchBookResult> data;
  final Function onTap;
  const SearchResultView({Key? key, required this.data, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: data.length,
      scrollDirection: Axis.vertical,
      itemBuilder: _cellForRow,
    );
  }

  Widget _cellForRow(BuildContext context, int index) {
    final size =MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        onTap(index);
      },
      child: SizedBox(
        width: size.width,
        height: size.height/8,
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                children: <Widget>[
                  Image.network(data[index].imageUrl,fit: BoxFit.cover,),
                  const SizedBox(
                    height: 5,
                  ),//分割线
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