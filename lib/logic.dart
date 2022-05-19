import 'dart:math';

const a = 0.0;
const b = 1;

List<double> getPoints(double a, double b, double step) {
  var x = a;
  final values = <double>[];

  while (x < b) {
    values.add(x);
    x += step;
  }
  if ((values.last - b).abs() > 0.01) {
    values.add(b);
  }

  return values;
}

double y(double x) => 3 * x - 2;

double f(double x, double y) => (y - 1) / (x - 1);

List<Point> euler(int n) {
  final h = (b - a) / n;

  final res = [const Point(0.0, -2.0)];

  for (var i = 1; i < n + 1; i++) {
    res.add(Point(a + h * i, res[i - 1].y + f(res[i - 1].x, res[i - 1].y) * h));
  }

  return res;
}

List<Point> pure(double n) {
  final h = (b - a) / n;

  final res = [const Point(0.0, -2.0)];

  for (var i = 0; i < n; i++) {
    res.add(Point(a + h * i, y(a + h * i)));
  }

  return res;
}

List<Point> taylor(int n) {
  final h = (b - a) / n;

  final res = [const Point(0.0, -2.0)];

  for (var i = 1; i < n + 1; i++) {
    res.add(Point(a + h * i, y(res[i - 1].x) + (y(res[i - 1].x) - 1) / (res[i - 1].x - 1) * h));
  }

  return res;
}

List<Point> adams(int n) {
  final h = (b - a) / n;

  const point0 = Point(0.0, -2.0);
  const p1 = 1 / 2;
  const p2 = 1 / 2;
  const alpha = 1;
  const beta = 1;
  final k1 = h * f(point0.x, point0.y);
  final k2 = h * f(point0.x + alpha * h, point0.y + beta * h * f(point0.x, point0.y));
  final y1 = point0.y + p1 * k1 + p2 * k2;

  final res = [const Point(a, -2.0), Point(a + h, y1)];

  for (var i = 2; i < n + 2; i++) {
    if ((res[i - 1].x - 1).abs() < 0.001) {
      continue;
    }
    final s =
        Point(a + h * i, res[i - 1].y + h / 2 * (3 * f(res[i - 1].x, res[i - 1].y) - f(res[i - 2].x, res[i - 2].y)));
    res.add(s);
  }

  return res;
}
