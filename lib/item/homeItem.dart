import 'package:flutter/material.dart';

import '../entity/article_entity.dart';

class HomeItem extends StatelessWidget {
  final int index;
  final ArticleEntityDataDatas item;
  final VoidCallback onTop;
  final VoidCallback onPressed;

  const HomeItem(
      {super.key,
      required this.index,
      required this.item,
      required this.onTop,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTop,
      child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: ListTile(
        title: Text(
          item.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        leading: IconButton(
          icon: item.collect
              ? Icon(Icons.favorite, color: Theme.of(context).primaryColor)
              : const Icon(Icons.favorite_border),
          tooltip: '收藏',
          onPressed: onPressed,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: <Widget>[
              Container(
                  constraints: const BoxConstraints(maxWidth: 150),
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 1.0),
                      borderRadius: BorderRadius.circular((20.0))),
                  child: Text(
                    item.superChapterName,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(item.author),
              )
            ],
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    ));
  }
}
