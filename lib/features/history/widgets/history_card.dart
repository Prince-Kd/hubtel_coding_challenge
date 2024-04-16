import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge/shared/utils/constants.dart';

import '../models/history_model.dart';

class HistoryCard extends StatelessWidget {
  final HistoryModel historyData;
  final bool? showDate;
  const HistoryCard(
      {super.key, required this.historyData, this.showDate = true});

  @override
  Widget build(BuildContext context) {
    Color statusColor() {
      switch (historyData.status.toLowerCase()) {
        case 'successful':
          return Colors.greenAccent;
        case 'failed':
          return Colors.red[900]!;
        default:
          return Colors.amber;
      }
    }

    timeFormat(){
      DateTime date = DateTime.parse(historyData.createdAt);
      int hour = date.hour;
      int minute = date.minute;
      return '$hour:$minute ${hour > 12 ? "PM":"AM"}';
    }

    dateFormat(){
      DateTime date = DateTime.parse(historyData.createdAt);
      int year = date.year;
      int month = date.month;
      int day = date.day;

      return '${months[month]} $day, $year';
    }

    Widget statusIcon() {
      switch (historyData.status.toLowerCase()) {
        case 'successful':
          return Icon(
            Icons.star_rounded,
            color: Colors.greenAccent,
            size: 20,
          );
        case 'failed':
          return Icon(
            Icons.dangerous_rounded,
            color: Colors.red[900],
            size: 20,
          );
        default:
          return Icon(
            Icons.star_rounded,
            color: Colors.amber,
            size: 20,
          );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDate == true)
          Column(
            children: [
              Chip(label: Text(dateFormat(), style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w700,),), backgroundColor: Colors.grey[300], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100), ), side: BorderSide.none),
              const SizedBox(height: 20,),
            ],
          ),

        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    timeFormat(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(historyData.bankImage),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  historyData.userName,
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  historyData.userPhone,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Chip(
                                  avatar: statusIcon(),
                                  label: Text(
                                    historyData.status,
                                    style: TextStyle(color: statusColor()),
                                  ),
                                  backgroundColor:
                                      statusColor().withOpacity(0.1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  side: BorderSide.none),
                              Text(
                                "GHS ${historyData.amount}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w800),
                              )
                            ],
                          )
                        ],
                      )),
                    ],
                  ),
                  Divider(
                    height: 40,
                    thickness: 1,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: Colors.indigoAccent,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(historyData.type),
                      if (historyData.review != null)
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.circle,
                                size: 5,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                historyData.review!,
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (historyData.liked)
                        Icon(
                          Icons.star_rounded,
                          size: 32,
                          color: Colors.amber,
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}
