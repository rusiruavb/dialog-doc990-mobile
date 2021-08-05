class CovidInfo {
  final int localCases;
  final int localDeaths;
  final int localRecovered;

  CovidInfo({
    this.localCases,
    this.localDeaths,
    this.localRecovered,
  });

  factory CovidInfo.fromJson(Map<String, dynamic> json) {
    return CovidInfo(
      localCases: json['local_new_cases'],
      localDeaths: json['local_deaths'],
      localRecovered: json['local_recovered'],
    );
  }
}
