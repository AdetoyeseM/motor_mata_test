import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String? imgUrl, title, desc, content;

  final Widget? icon;

  // ignore: use_key_in_widget_constructors
  const NewsTile({
    this.imgUrl,
    this.desc,
    this.title,
    this.content,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Card(
        elevation: 0.5,
        child: Container(
            margin: const EdgeInsets.only(bottom: 24),
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl!,
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    title!,
                    maxLines: 2,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc!,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  // ignore: prefer_const_constructors
                  const SizedBox(
                    height: 4,
                  ),
                  Align(alignment: Alignment.bottomRight, child: icon!),
                ],
              ),
            )),
      ),
    );
  }
}
