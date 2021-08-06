class CovidInfo {
  final int localCases;
  final int localDeaths;
  final int localRecovered;
  final String lastUpdated;

  CovidInfo({
    this.localCases,
    this.localDeaths,
    this.localRecovered,
    this.lastUpdated,
  });

  factory CovidInfo.fromJson(Map<String, dynamic> json) {
    return CovidInfo(
      localCases: json['local_new_cases'],
      localDeaths: json['local_deaths'],
      localRecovered: json['local_recovered'],
      lastUpdated: json['update_date_time'],
    );
  }
}
