class HistoryModel {
  final String createdAt;
  final String bankImage;
  final String userName;
  final String userPhone;
  final String status;
  final String amount;
  final bool liked;
  final String? review;
  final String type;

  const HistoryModel({
    required this.createdAt,
    required this.bankImage,
    required this.userName,
    required this.userPhone,
    required this.status,
    required this.amount,
    this.liked = false,
    this.review,
    required this.type,
  });
}
