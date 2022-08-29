import 'package:flutter/material.dart';
import 'package:kreader/pages/search/components/book_item.dart';

class SearchResultView extends StatelessWidget {
  final List<BookItem> data;
  final Function onTap;

  const SearchResultView({Key? key, required this.data, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: data.length,
      scrollDirection: Axis.vertical,
      itemBuilder: _cellForRow,
    );
  }

  Widget _cellForRow(BuildContext context, int index) {
    final size = MediaQuery.of(context).size;
    final List<String> categories = data[index].categories;
    return InkWell(
        onTap: () {
          onTap(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: size.width,
            height: size.height / 8,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: size.height / 8 * 0.75,
                  height: size.height / 8,
                  child: Image.network(
                    data[index].imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index].bookName,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            data[index].author,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 8.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (BuildContext context, int index2) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  categories[index2],
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 10,
                                  ),
                                  strutStyle: StrutStyle(
                                    forceStrutHeight: true,
                                    leading: 0.5,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
