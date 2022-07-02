extension DurationX on int {
  Duration get seconds => Duration(seconds: this);

  Duration get milliSeconds => Duration(milliseconds: this);

  Duration get microSeconds => Duration(microseconds: this);

  Duration get minutes => Duration(minutes: this);
}
