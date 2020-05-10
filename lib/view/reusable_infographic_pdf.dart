import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

import '../style.dart';

class ReusableInfographicPdf extends StatefulWidget {
  // Navigation bar title
  final String title;
  final String pdfUrl;
  final Color backgroundColor;
  final Color toolBarColor;

  const ReusableInfographicPdf({
    this.title,
    this.pdfUrl,
    this.backgroundColor,
    this.toolBarColor,
  });

  @override
  _ReusableInfographicPdfState createState() => _ReusableInfographicPdfState();
}

class _ReusableInfographicPdfState extends State<ReusableInfographicPdf> {
  int _pageNumber;
  PdfController pdfController;
  @override
  void initState() {
    pdfController = PdfController(
      document: PdfDocument.openAsset(widget.pdfUrl),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.backgroundColor,
        appBar: AppBar(
          // Warning brightness interacts with SystemUiOverlayStyle
          // See system_bars.dart comments
          brightness: Brightness.light,
          backgroundColor: widget.toolBarColor,
          iconTheme: Styles.appBarIconTheme,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              widget.title,
              style: Styles.textH5,
            ),
            if (_pageNumber != null)
              Text(
                'Page $_pageNumber of ${pdfController.pagesCount}',
                style: Styles.textFooter,
              )
          ]),
          leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(null)),
        ),
        body: Scrollbar(
            child: PdfView(
                controller: pdfController,
                scrollDirection: Axis.vertical,
                onPageChanged: (page) {
                  setState(() {
                    _pageNumber = page;
                  });
                },
                onDocumentLoaded: (_) => setState(() {
                      _pageNumber = pdfController.page;
                    }))));
  }
}
