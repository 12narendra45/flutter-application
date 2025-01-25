import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';
import 'widgets.dart';

class DataFetchingPage extends ConsumerWidget {
  const DataFetchingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dataProvider);
    final notifiy = ref.read(dataProvider.notifier);
    final searchedText = ref.watch(searchProvider);
    final userNeed = state.data
        .where((item) => item.toLowerCase().contains(searchedText.toLowerCase()))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Application'),
      ),
       backgroundColor: const Color.fromARGB(255, 25, 199, 193),
      body:Column(
        children:[          
          Padding( // Search Bar for flittering data
            padding: const EdgeInsets.all(9.0),
            child: TextField(
              onChanged:(value)=>ref.read(searchProvider.notifier).state=value,
              decoration:InputDecoration(
                hintText:'Search item name',
                prefixIcon:Icon(Icons.search),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
          ),
          Expanded(
            child: state.isLoading
                ?ListView.builder(
                    itemCount: 10,
                    itemBuilder:(context, index){
                      return shimmer();
                    },
                  )
                :NotificationListener<ScrollNotification>(
                    onNotification:(scrollInfo) {
                      if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                        notifiy.fetchDataDown();
                      }
                      if (scrollInfo.metrics.pixels <= 50 && !state.isLoadingUP) {
                        notifiy.fetchDataUp();
                      }
                    return true;
                    },
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 600),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: userNeed.length+
                              (state.isLoadingUP?1:0) +
                              (state.isLoadingDown?1:0),
                          itemBuilder:(context,index) {
                            if (state.isLoadingUP&& index == 0){ // Shimmer effect while loading data
                              return shimmer();
                            }
                            // Actual data
                            final dataIndex = state.isLoadingUP? index - 1 : index;
                            if (dataIndex >= 0&&dataIndex < userNeed.length) {
                              return ListTile(
                                title: highlightText(
                                  userNeed[dataIndex],
                                  searchedText,
                                ),
                              );
                            }
                            if (state.isLoadingDown&&index == userNeed.length +(state.isLoadingUP? 1 : 0)) {  // Shimmer effect while loading data
                              return shimmer();
                            }
                            return SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
