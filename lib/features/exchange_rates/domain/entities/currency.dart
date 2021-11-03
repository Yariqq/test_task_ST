
import 'package:equatable/equatable.dart';

class Currency extends Equatable{
  final int id;
  final String date;
  final String abbreviation;
  final int scale;
  final String name;
  final double rate;
  bool isVisible;

  Currency({
    required this.id,
    required this.date,
    required this.abbreviation,
    required this.scale,
    required this.name,
    required this.rate,
    required this.isVisible,
  });

  @override
  List<Object?> get props => [
    id,
    date,
    abbreviation,
    scale,
    name,
    rate,
    isVisible,
  ];

}