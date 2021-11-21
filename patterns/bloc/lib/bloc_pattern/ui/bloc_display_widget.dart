import 'package:bloc/bloc_pattern/bloc/count_bloc.dart';
import 'package:flutter/material.dart';

CountBloc? countBloc;

class BlocDisplayWidget extends StatefulWidget {
  const BlocDisplayWidget({Key? key}) : super(key: key);

  @override
  _BlocDisplayWidgetState createState() => _BlocDisplayWidgetState();
}

class _BlocDisplayWidgetState extends State<BlocDisplayWidget> {
  @override
  void initState() {
    super.initState();
    countBloc = CountBloc();
  }

  @override
  void dispose() {
    super.dispose();
    countBloc!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Pattern'),
      ),
      body: CountView(),
      floatingActionButton: Row(
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              countBloc!.countEventBloc.countEventSink
                  .add(CountEvent.Add_EVENT);
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
