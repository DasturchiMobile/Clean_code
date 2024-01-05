import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeFetchData(count: [0,10]));
    super.initState();
  }
  final ScrollController _controller = ScrollController();
  int itemLen = 10;
  @override
  Widget build(BuildContext context) {
    pagination();
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if(state is HomeError){
            return Center(child: Text(state.errorMsg),);
          }
          if(state is HomeSuccess){
            return ListView(
              controller: _controller,
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: state.entries.length <= itemLen ? state.entries.length: itemLen,
                    itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal,
                    ),
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          state.entries[index].aPI!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          state.entries[index].description!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w800),
                        ),
                        ElevatedButton(onPressed: () {
                          try{
                            launch(state.entries[index].link!);
                          }catch(e){}
                        }, child: Text("site Link")),
                      ],
                    ),
                  );
                }),
                if(itemLen != state.entries.length)const Center(child: CircularProgressIndicator.adaptive(),),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive(),);
        },
      ),
    );
  }
  pagination() {
    _controller.addListener(() async {
      if(_controller.position.pixels  == _controller.position.maxScrollExtent){
      // await Future.delayed(const Duration(seconds: 2));
        print("object");
        setState(() {
          itemLen +=30;
        });
      }
    });
  }
}
