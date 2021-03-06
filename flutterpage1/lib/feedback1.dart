import 'package:flutter/material.dart';
import 'package:quick_feedback/quick_feedback.dart';

class MyFeedbackPage1 extends StatelessWidget {
  const MyFeedbackPage1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.white,
              )),
          title: Text('Quick Feedback'),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: ElevatedButton(
                onPressed: () => _showFeedback(
                    context), // this will trigger the feedback modal
                child: Text('Feedback'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showFeedback(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return QuickFeedback(
          title: 'Leave a feedback', // Title of dialog
          showTextBox: true, // default false
          textBoxHint:
              'Share your feedback', // Feedback text field hint text default: Tell us more
          submitText: 'SUBMIT', // submit button text default: SUBMIT
          onSubmitCallback: (feedback) {
            print('$feedback'); // map { rating: 2, feedback: 'some feedback' }
            Navigator.of(context).pop();
          },
          askLaterText: 'ASK LATER',
          onAskLaterCallback: () {
            print('Do something on ask later click');
          },
        );
      },
    );
  }
}
