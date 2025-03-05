import 'package:flutter/material.dart';
import '../../../res/resource_list.dart';

class DisplayCard extends StatelessWidget {
  const DisplayCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    double sHeight = MediaQuery.of(context).size.height;
    double sWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            height: sHeight * 0.22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Image.network(ResourceList.imageList[index],
              height: sHeight * 0.18,
              width: sWidth * 0.35,
              fit: BoxFit.cover,),
          ),
          SizedBox(height: sHeight * 0.01,),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Text(
                  ResourceList.storiesList[index].replaceAll('.pdf', ''),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: sHeight * 0.001,),
                Text(
                  '19${ResourceList.yearList[index]}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}