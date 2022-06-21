import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class TextFieldCustom extends StatefulWidget {
  //TextFieldCustom({Key? key}) : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();

  static const _textList = ['Health', 'Exercise'];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            TypeAheadFormField(
              suggestionsCallback: (pattern) => _textList.where((item) => item
                  .toString()
                  .toLowerCase()
                  .contains(pattern.toString().toLowerCase())),
              itemBuilder: (_, String item) => ListTile(
                title: Text(item),
              ),
              onSuggestionSelected: (String val) {
                _textController.text = val;
              },
              getImmediateSuggestions: true,
              hideSuggestionsOnKeyboardHide: false,
              hideOnEmpty: true,
              // noItemsFoundBuilder: (context) => const Padding(
              //   padding: EdgeInsets.all(8),
              //   child: Text('No item found'),
              // ),
              textFieldConfiguration: TextFieldConfiguration(
                decoration: const InputDecoration(
                  hintText: 'Type something ',
                  border: OutlineInputBorder(),
                ),
                controller: _textController,
              ),
            ),
            ElevatedButton(
                onPressed: () => print(_textController.text),
                child: const Text('Click'))
          ],
        ),
      ),
    );
  }
}
