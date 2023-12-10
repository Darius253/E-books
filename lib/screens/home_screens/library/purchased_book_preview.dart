import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:reader_app/shared/exports.dart';

class Preview extends StatefulWidget {
  final String bookTitle;
  final String authorName;
  final String image;
  final String bookUrl;
  const Preview({
    Key? key,
    required this.bookTitle,
    required this.authorName,
    required this.image,
    required this.bookUrl,
  }) : super(key: key);

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int pages = 0;
  int currentPage = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.2,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.07),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: height * 0.2,
                            width: width,
                            child: CachedNetworkImage(
                              imageUrl: widget.image,
                              filterQuality: FilterQuality.low,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator.adaptive(
                                  backgroundColor: Palette.primary,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                            ),
                          ),
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaY: 3, sigmaX: 10),
                            child: Container(
                              height: height * 0.2,
                              color: const Color.fromARGB(141, 0, 0, 0),
                            ),
                          ),
                          Positioned(
                            left: width * 0.35,
                            child: Container(
                              height: height * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: widget.image,
                                filterQuality: FilterQuality.low,
                                fit: BoxFit.fill,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator.adaptive(
                                    backgroundColor: Palette.primary,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    appBar(width, height, widget.bookTitle, true),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: width * 0.15,
                  left: width * 0.15,
                  top: height * 0.025,
                ),
                child: SizedBox(
                  width: width * 0.7,
                  child: Text(
                    widget.bookTitle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.48,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'By ${widget.authorName}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width,
                height: height,
                child: PDFView(
                  enableSwipe: true,
                  swipeHorizontal: true,
                  pageFling: true,
                  autoSpacing: true,
                  pageSnap: true,
                  defaultPage: 0,
                  fitPolicy: FitPolicy.BOTH,
                  onRender: (pages) => setState(() => this.pages = pages!),
                  onViewCreated: (PDFViewController pdfViewController) {
                    _controller.complete(pdfViewController);
                  },
                  onPageChanged: (int? page, int? total) {
                    setState(() {
                      currentPage = page!;
                    });
                  },
                  filePath: widget.bookUrl,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:FutureBuilder<PDFViewController>(
  future: _controller.future,
  builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Palette.primary,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else if (snapshot.hasError) {
      return const Text('Something went wrong');
    } else if (!snapshot.hasData || snapshot.data == null) {
      return Container();
    }
    
    
    return Padding(
      padding: EdgeInsets.only(left: width * 0.55, top: height * 0.9),
      child: changePage(
        height,
        width,
        currentPage,
        pages,
        () async {
          await snapshot.data?.setPage(currentPage - 1);
        },
        () async {
          await snapshot.data?.setPage(currentPage + 1);
        },
      ),
    );
  },
),

    );
  }
}
