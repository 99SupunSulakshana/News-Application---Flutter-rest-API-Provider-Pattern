// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'package:cbs_news/models/news_data.dart';
import 'package:cbs_news/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Stories - CBS News'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              context.read<NewsData>().initialValues();
              context.read<NewsData>().fetchData;
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<NewsData>().fetchData;
        },
        child: Center(
          child: Consumer<NewsData>(
            builder: (context, value, child) {
              return value.map.length == 0 && !value.error
                  ? CircularProgressIndicator()
                  : value.error
                      ? Text(
                          'Oops, something went wrong. ${value.errorMessage}',
                          textAlign: TextAlign.center)
                      : ListView.builder(
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return NewsCard(map: value.map['articles'][index]);
                          },
                        );
            },
          ),
        ),
      ),
    );
  }
}
