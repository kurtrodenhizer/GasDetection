// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

//import 'example_code_parser.dart';
//import 'syntax_highlighter.dart';

class ComponentDemoTabData {
  ComponentDemoTabData({
    required this.demoWidget,
    required this.exampleCodeTag,
    required this.description,
    required this.tabName,
    required this.documentationUrl,
  });

  final Widget demoWidget;
  final String exampleCodeTag;
  final String description;
  final String tabName;
  final String documentationUrl;

  // @override
  // bool operator ==(Object other) {
  //   if (other.runtimeType != runtimeType) return false;
  //   final ComponentDemoTabData typedOther = other;
  //   return typedOther.tabName == tabName &&
  //       typedOther.description == description &&
  //       typedOther.documentationUrl == documentationUrl;
  // }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      ((other as ComponentDemoTabData).tabName == tabName &&
          (other as ComponentDemoTabData).description == description &&
          (other as ComponentDemoTabData).documentationUrl == documentationUrl);

  @override
  int get hashCode => hashValues(tabName, description, documentationUrl);
}

class TabbedComponentDemoScaffold extends StatelessWidget {
  const TabbedComponentDemoScaffold({
    required this.title,
    required this.demos,
    required this.actions,
  });

  final List<ComponentDemoTabData> demos;
  final String title;
  final List<Widget> actions;

  void _showExampleCode(BuildContext context) {
    final String tag =
        demos[DefaultTabController.of(context).index].exampleCodeTag;
    if (tag.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute<FullScreenCodeDialog>(
              builder: (BuildContext context) =>
                  FullScreenCodeDialog(exampleCodeTag: tag)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: demos.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Color(0xFF000000)),
          ),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          actions: (actions)
            ..addAll(
              <Widget>[
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.library_books,
                          semanticLabel: 'Show documentation'),
                      onPressed: () => {},
                    );
                  },
                ),
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.code),
                      tooltip: 'Show example code',
                      onPressed: () => _showExampleCode(context),
                    );
                  },
                ),
              ],
            ),
          bottom: TabBar(
            isScrollable: true,
            tabs: demos
                .map<Widget>(
                    (ComponentDemoTabData data) => Tab(text: data.tabName))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: demos.map<Widget>((ComponentDemoTabData demo) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      demo.description,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Expanded(child: demo.demoWidget),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class FullScreenCodeDialog extends StatefulWidget {
  const FullScreenCodeDialog({required this.exampleCodeTag});

  final String exampleCodeTag;

  @override
  FullScreenCodeDialogState createState() => FullScreenCodeDialogState();
}

class FullScreenCodeDialogState extends State<FullScreenCodeDialog> {
  late String _exampleCode;

  @override
  void didChangeDependencies() {
    /* getExampleCode(widget.exampleCodeTag, DefaultAssetBundle.of(context)).then<void>((String code) {
      if (mounted) {
        setState(() {
          _exampleCode = code ?? 'Example code not found';
        });
      }
    });*/
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    /*final SyntaxHighlighterStyle style = Theme.of(context).brightness == Brightness.dark
      ? SyntaxHighlighterStyle.darkThemeStyle()
      : SyntaxHighlighterStyle.lightThemeStyle();*/

    Widget body;
    if (_exampleCode.isNotEmpty) {
      body = const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      body = SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontFamily: 'monospace', fontSize: 10.0),
              children: <TextSpan>[],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.clear,
            semanticLabel: 'Close',
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Example code'),
      ),
      body: body,
    );
  }
}

/*
class MaterialDemoDocumentationButton extends StatelessWidget {
  MaterialDemoDocumentationButton(String routeName, { Key key })
    : documentationUrl = kDemoDocumentationUrl[routeName],
      assert(
        kDemoDocumentationUrl[routeName] != null,
        'A documentation URL was not specified for demo route $routeName in kAllGalleryDemos',
      ),
      super(key: key);

  final String documentationUrl;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.library_books),
      tooltip: 'API documentation',
     */
/* onPressed: () => launch(documentationUrl, forceWebView: true),*/ /*

    );
  }
}

class CupertinoDemoDocumentationButton extends StatelessWidget {
  CupertinoDemoDocumentationButton(String routeName, { Key key })
    : documentationUrl = kDemoDocumentationUrl[routeName],
      assert(
        kDemoDocumentationUrl[routeName] != null,
        'A documentation URL was not specified for demo route $routeName in kAllGalleryDemos',
      ),
      super(key: key);

  final String documentationUrl;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Semantics(
        label: 'API documentation',
        child: const Icon(CupertinoIcons.book),
      ),
     */
/* onPressed: () => launch(documentationUrl, forceWebView: true),*/ /*

    );
  }
}
*/
