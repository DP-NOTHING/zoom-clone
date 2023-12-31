import 'dart:math';
import 'package:flutter/material.dart';
import 'package:talkstream/resources/jitsi_meet_methods.dart';
import 'package:talkstream/utils/colors.dart';
import 'package:talkstream/widgets/meeting_button.dart';


class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods=JitsiMeetMethods();


  createNewMeeting() async{
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();

    _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);

  }
  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MeetingButton(
              onPressed:createNewMeeting,
              //     (){
              //   var random = Random();
              //   String roomName = (random.nextInt(10000000) + 10000000).toString();
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) {
              //       return VideoConferencePage(
              //         conferenceID: roomName,
              //       );
              //     }),
              //   );
              // },
              icon: Icons.videocam,
              text: "new meeting",
            ),
            MeetingButton(
              onPressed: ()=>joinMeeting(context),
              text: "Join Meeting",
              icon: Icons.add_box_rounded,
            ),
            MeetingButton(
              onPressed: (){},
              text: "Share Screen",
              icon: Icons.arrow_upward_rounded,
            ),
          ],
        ),
        const Expanded(
            child: Center(
              child: Text(
                'create or Join with just a click',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            )
        )
      ],
    );
  }
}
