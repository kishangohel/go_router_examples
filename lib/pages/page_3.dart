import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_examples/app_router.dart';
import 'package:go_router_examples/blocs/page3/page3_cubit.dart';
import 'package:logger/logger.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final cubit = BlocProvider.of<Page3Cubit>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Page3')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: cubit.increaseCounter,
        label: const Text('Increase'),
      ),
      body: PageStorage(
        bucket: pageBucket,
        child: BlocBuilder<Page3Cubit, Page3State>(
          builder: (context, state) {
            return SingleChildScrollView(
              key: const PageStorageKey('Page31'),
              child: Column(
                children: [
                  Text('Counter : ${state.counter}'),
                  ListView.builder(
                    key: const PageStorageKey('Page3'),
                    // controller: cubit.scrollController,
                    itemBuilder: (context, index) => Text('Item $index'),
                    itemCount: 100,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    Logger().d('disposing...');
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
