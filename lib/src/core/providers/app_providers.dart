import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final primeiroProvider = Provider<String>((ref) => "Flutter Riverpod");
final counterProvider = StateProvider<int>((ref) => 0);
final themeSwitchProvider = StateProvider((ref) => false);