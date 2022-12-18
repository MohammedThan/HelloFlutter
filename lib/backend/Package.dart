class Package {
  String Sender_Id = "";
  String destination = "";
  String dimensions = "";
  DateTime finalDate = new DateTime(0);
  double insurance = 0;
  String status = "";
  String type = "";
  double weight = 0;
  double payment = 0;
  String reciver_Id = "";
  DateTime Sent_Date = new DateTime(0);
  String SID = "1";

  Package(
      String Sender_Id,
      String destination,
      String dimensions,
      DateTime finalDate,
      double insurance,
      String status,
      String type,
      double weight,
      double payment,
      String reciver_Id,
      DateTime Sent_Date) {
    this.Sender_Id = Sender_Id;
    this.destination = destination;
    this.dimensions = dimensions;
    this.finalDate = finalDate;
    this.insurance = insurance;
    this.status = status;
    this.type = type;
    this.weight = weight;
    this.payment = payment;
    this.reciver_Id = reciver_Id;
    this.Sent_Date = Sent_Date;
  }
}
