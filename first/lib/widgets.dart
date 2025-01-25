import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmer(){
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: ListTile(
      title: Container(
        color: Colors.white,
        height: 20,
        width: double.infinity,
      ),
    ),
  );
}
Widget highlightText(String text, String query) {
  if (query.isEmpty){
    return Text(text);
  }
  final regExp = RegExp('($query)', caseSensitive: false);
  final matches = regExp.allMatches(text);
  if (matches.isEmpty){
    return Text(text);
  }
final highlightedText =< TextSpan>[];
int lastMatchEnd=0;
  for (final match in matches) {
    if (match.start>lastMatchEnd){
      highlightedText.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
    }
    highlightedText.add(TextSpan(
      text:match.group(0),
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ));
    lastMatchEnd = match.end;
  }
  if (lastMatchEnd < text.length) {
    highlightedText.add(TextSpan(text: text.substring(lastMatchEnd)));
  }

  return RichText(text: TextSpan(style: TextStyle(color: Colors.black), children: highlightedText));
}
