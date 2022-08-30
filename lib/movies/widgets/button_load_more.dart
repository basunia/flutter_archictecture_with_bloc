import 'package:flutter/material.dart';

import 'bottom_loader.dart';

class ButtonLoadMore extends StatefulWidget {
  const ButtonLoadMore({Key? key, required this.loadMore}) : super(key: key);
  final void Function() loadMore;

  @override
  State<ButtonLoadMore> createState() => _ButtonLoadMoreState();
}

class _ButtonLoadMoreState extends State<ButtonLoadMore> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const BottomLoader()
        : ElevatedButton(
            // style: ButtonStyle(backgroundColor: ),
            onPressed: () {
              widget.loadMore();
              setState(() {
                isLoading = true;
              });
            },
            child: const Text('Load more...'));
  }
}
