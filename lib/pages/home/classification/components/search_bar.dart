import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.hintLabel}) : super(key: key);

  final String hintLabel;

  @override
  State<StatefulWidget> createState() {
    return SearchBarState();
  }
}

class SearchBarState extends State<SearchBar> {
  late FocusNode _focusNode;

  ///默认不展示控件

  bool _offstage = true;

  ///监听TextField内容变化
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
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
      height: 30,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255,245, 246, 250), borderRadius: BorderRadius.circular(4)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding( padding: EdgeInsets.only(left: 8),),
                  const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  const Padding( padding: EdgeInsets.only(left: 8),),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: _textEditingController,
                      autofocus: false,
                      focusNode: _focusNode,
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)
                        ),
                        hintText: widget.hintLabel,
                        contentPadding: const EdgeInsets.only(top: 0,bottom: 0),
                        enabledBorder:  const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                        ),
                        disabledBorder:  const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                        ),
                        focusedBorder:  const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const Padding( padding: EdgeInsets.only(left: 8),),
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
                  const Padding( padding: EdgeInsets.only(left: 8),),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _focusNode.unfocus();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: const Text("取消",
                  style: TextStyle(fontSize: 16, color: Color(0xFF3D7DFF))),
            ),
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