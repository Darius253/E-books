import 'package:flutter/material.dart';
import 'package:reader_app/shared/exports.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _controller = TextEditingController();
  String? comment;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(
              width,
              height,
              'Leave a review',
              false,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.07),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Write a comment',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      width: width,
                      height: height * 0.25,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: Color(0xFFD9D9D9)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: TextFormField(
                        maxLines: 50,
                        maxLength: 250,
                        controller: _controller,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Leave review here.'),
                        validator: (value) => value!.isEmpty
                            ? 'You cannot submit an Empty Review'
                            : null,
                        onChanged: (value) {
                          setState(() {
                            comment = value;
                          });
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            comment = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            print(comment);
                          }
                        },
                        child: Container(
                          width: 80,
                          height: 41,
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF7BF97),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Comment',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
