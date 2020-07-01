import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultItem extends StatelessWidget {
  final String image;
  final String url;
  final String description;
  final String price;

  const ResultItem(
      {Key key, this.image, this.url, this.description, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: ()=> _launchUrl(),
        child: Container(
          height: 400,
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  image,
                  height: 300,
                  width: 300,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Text(
                description ?? 'failed to load',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              Text(
                price ?? 'failed to load',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchUrl() async {
    await launch(url);
  }
}
