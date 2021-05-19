import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:taza_hawal/Models/News.dart';
import 'package:taza_hawal/Utilities/ThemeOf.dart';

class DetailsScreen extends StatelessWidget {
  static const routeDetailsScreen = '/details';

  Color color = Colors.blueAccent.shade700;

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as News;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          news.title,
          overflow: TextOverflow.ellipsis,
          style: theme(context).textTheme.button!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xffeddaa6)),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xffeddaa6),
          ),
          onPressed: () =>Navigator.pop(context),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Image.network(
                    news.urlToImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.only(top: 32.0, left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(news.title,
                            style: theme(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontWeight: FontWeight.bold)),
                        Padding(
                          padding: EdgeInsets.only(top: 6.0),
                          child: Text(
                            news.author,
                            textAlign: TextAlign.left,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(14),
                  child: Text(news.description,
                      style: theme(context).textTheme.bodyText2),
                ),
                Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _buildButtonColumn(color, Icons.favorite, 'Like'),
                        GestureDetector(
                            onTap: () => FlutterClipboard.copy(news.description)
                                .then((value) => showAlertDialog(context)),
                            child:
                                _buildButtonColumn(color, Icons.copy, 'Copy')),
                        GestureDetector(
                            onTap: () => Share.share(news.title,
                                subject: news.description),
                            child: _buildButtonColumn(
                                color, Icons.share, 'SHARE')),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text(
        "Close",
        style: theme(context).textTheme.bodyText1,
      ),
      style: TextButton.styleFrom(
        primary: theme(context).accentColor,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Copied"),
      content: Text("Text Copied to Clipboard !"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
