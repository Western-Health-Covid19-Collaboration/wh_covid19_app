// *** WARNING ***
// When disclaimerBody changes in any way, increment disclaimerVersion by one
class DisclaimerDetails {
  bool agreed;
  String version;
  String dateStamp;

  DisclaimerDetails({
    this.agreed,
    this.version,
    this.dateStamp,
  });
}
