class Temperature {
  double temp;
  double res;

  Temperature({required this.temp, this.res = 0});

  double CalculCelcius(double temp) {
    res = (temp - 32) * 5 / 9;
    return res;
  }

  double CalculFahrn(double temp) {
    res = (temp * 9 / 5) + 32;
    return res;
  }
}
