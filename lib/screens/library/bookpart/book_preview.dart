import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class BookPeview extends StatefulWidget {
  final String bookTitle;
  final String bookAuthor;
  final String bookDescription;
  final String bookImageUrl;

  const BookPeview({
    super.key,
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookDescription,
    required this.bookImageUrl,
  });

  @override
  State<BookPeview> createState() => _BookPeviewState();
}

class _BookPeviewState extends State<BookPeview> {
  bool _showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.070),
          child: TopBar(
            bookTitle: widget.bookTitle,
          ),
        ),
        body: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                widget.bookImageUrl,
                fit: BoxFit.contain,
                height: _showFullDescription ? height * 0.0 : height * 0.3,
                width: double.infinity,
              ),
              if (_showFullDescription == false)
                Container(
                  width: width * 0.95,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.bookTitle,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Palette.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${widget.bookAuthor}  >',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Palette.black,
                        ),
                      ),
                       SizedBox(height: height * 0.04),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Book Description',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Palette.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showFullDescription = !_showFullDescription;
                          });
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${widget.bookDescription.substring(
                                  0,
                                  _showFullDescription
                                      ? widget.bookDescription.length
                                      : 200,
                                )}..',
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Palette.black,
                                ),
                              ),
                              if (!_showFullDescription)
                                const TextSpan(
                                  text: '... ',
                                ),
                              const TextSpan(
                                text: 'read more',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Palette.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.009),
                      SizedBox(
                        height: height * 0.072,
                        width: width * 0.6,
                        child: ListView.builder(
                          itemCount: bookgenres.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GenreChips(bookgenres: bookgenres[index],),
                          );
                        }),
                      ),
                      SizedBox(height: height * 0.030),
                      Button(
                        onTap: () {
                          setState(() {
                            _showFullDescription = true;
                          });
                        },
                        text: 'Read More',
                      ),
                    ],
                  ),
                ),
              if (_showFullDescription == true)
                Container(
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.bookImageUrl),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.black.withOpacity(0.8),
                  ),
                  child: Center(
                    child: Image.asset(widget.bookImageUrl,
                        height: height * 0.2, width: width),
                  ),
                ),
              if (_showFullDescription == true)
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.bookTitle,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Palette.black,
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            'By ${widget.bookAuthor}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Palette.black,
                            ),
                          ),
                          SizedBox(height: height * 0.025),
                          SizedBox(
                            width: width * 0.87,
                            child: Text(
                              widget.bookDescription,
                              textAlign: TextAlign.center,
                              style:  const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Baskervville',
                                color: Color.fromARGB(255, 71, 71, 71)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
