enum TYPE{forexAndCfd,shareTrading,partners,mamPamm,investorAccount}
class ApplicationModel {
  ApplicationModel({
    required this.appName,
    required this.type,
  });

  String appName;
  TYPE type;

  String getName() {
    return appName;
  }

  TYPE getCode() {
    return type;
  }
}
