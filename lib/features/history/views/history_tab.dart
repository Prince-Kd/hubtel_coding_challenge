import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge/features/history/models/history_model.dart';
import 'package:hubtel_coding_challenge/features/history/widgets/history_card.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    List dummyData = [
      HistoryModel(
        createdAt: DateTime.now().toIso8601String(),
        bankImage: "assets/images/mtn.png",
        userName: 'Emmanuel Rockson Kwabena Uncle Ebo',
        userPhone: '024 123 4567',
        amount: "500",
        status: "Successful",
        review: "Cool your heart wai",
        liked: true,
        type: "Personal",
      ),
      HistoryModel(
        createdAt: DateTime.now().toIso8601String(),
        bankImage: "assets/images/mtn.png",
        userName: 'Absa Bank',
        userPhone: '024 123 4567',
        amount: "500",
        status: "Failed",
        review: "Cool your heart wai",
        liked: false,
        type: "Personal",
      ),
      HistoryModel(
        createdAt: DateTime.now().subtract(Duration(days: 1)).toIso8601String(),
        bankImage: "assets/images/mtn.png",
        userName: 'Emmanuel Rockson',
        userPhone: '024 123 4567',
        amount: "500",
        status: "Successful",
        review: "Cool your heart wai",
        liked: true,
        type: "Other",
      ),
      HistoryModel(
        createdAt: DateTime.now().subtract(Duration(days: 1)).toIso8601String(),
        bankImage: "assets/images/mtn.png",
        userName: 'Emmanuel Rockson',
        userPhone: '024 123 4567',
        amount: "500",
        status: "Successful",
        liked: true,
        type: "Other",
      ),
    ];
    return ListView.separated(
      itemBuilder: (context, index) {
        bool showDate() {
          if (index == 0) {
            return true;
          } else if (DateTime.parse(dummyData[index - 1].createdAt).day ==
              DateTime.parse(dummyData[index].createdAt).day) {
            return false;
          } else {
            return true;
          }
        }

        return Column(
          children: [
            HistoryCard(
              historyData: dummyData[index],
              showDate: showDate(),
            ),
            if (index+1 == dummyData.length)
              const SizedBox(
                height: 80,
              ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: dummyData.length,
    );
  }
}
