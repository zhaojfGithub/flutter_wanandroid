import 'package:flutter/material.dart';

import '../entity/project_entity.dart';

class ProjectListItem extends StatelessWidget {
  final ProjectEntityDataDatas item;
  final Function(int) onTop;

  const ProjectListItem({super.key, required this.item, required this.onTop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTop(item.id);
      },
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 2,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ///权重布局
                Expanded(flex: 2, child: Image.network(item.envelopePic)),
                Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              item.title,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )),
                        Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              item.desc,
                              style: const TextStyle(fontSize: 14, color: Colors.grey),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            )),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      item.niceDate,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  item.author,
                                  style: const TextStyle(fontSize: 14),
                                  textAlign: TextAlign.right,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
