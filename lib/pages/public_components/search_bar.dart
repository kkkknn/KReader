import 'package:flutter/material.dart';
import 'package:kreader/pages/constants.dart';

class SearchBar extends StatefulWidget {
  const SearchBar(
      {Key? key,
      required this.hintLabel,
      required this.onTap,
      required this.searchWord})
      : super(key: key);
  final String searchWord;
  final String hintLabel;
  final Function onTap;

  @override
  State<StatefulWidget> createState() {
    return SearchBarState();
  }
}

class SearchBarState extends State<SearchBar> {
  late FocusNode _focusNode;
  ///默认不展示控件
  bool _offstage = true;


  final TextEditingController _textEditingController =TextEditingController();


  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    if(widget.searchWord.isNotEmpty){
      _textEditingController.text=widget.searchWord;
      _textEditingController.selection=TextSelection.fromPosition(TextPosition(
          affinity: TextAffinity.downstream,
          offset: widget.searchWord.length),
      );
    }
    _textEditingController.addListener(() {
      var isVisible = _textEditingController.text.isNotEmpty;
      _updateDelIconVisible(isVisible);
    });
  }

  _updateDelIconVisible(bool isVisible) {
    setState(() {
      _offstage = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 245, 246, 250),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: _textEditingController,
                      autofocus: false,
                      focusNode: _focusNode,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        hintText: widget.hintLabel,
                        contentPadding:
                            const EdgeInsets.only(top: 0, bottom: 0),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                  ),
                  Offstage(
                    offstage: _offstage,
                    child: GestureDetector(
                      onTap: () => {_textEditingController.clear()},
                      child: const Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _focusNode.unfocus();
              widget.onTap(_textEditingController.text);
            },
            child: const Text('搜索',
                style: TextStyle(fontSize: 14, color: Config.primaryColor),),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.unfocus();
  }
}
