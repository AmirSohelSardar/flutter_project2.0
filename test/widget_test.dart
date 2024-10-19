import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app_flutter/main.dart';

void main() {
  testWidgets('Check if home screen shows the app title', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(child: MyApp()));

    expect(find.text('Flutter Movie App ❤️'), findsOneWidget);
  });

  testWidgets('Check if Top Rated Movies section is present', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(child: MyApp()));

    await tester.drag(find.byType(ListView), Offset(0, -300));
    await tester.pump();

    expect(find.text('Top Rated Movies'), findsOneWidget);
  });

  testWidgets('Check if Trending Movies section is present', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(child: MyApp()));

    await tester.drag(find.byType(ListView), Offset(0, -300));
    await tester.pump();

    expect(find.text('Trending Movies'), findsOneWidget);
  });

  testWidgets('Check if Popular TV Shows section is present', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(child: MyApp()));

    await tester.drag(find.byType(ListView), Offset(0, -300));
    await tester.pump();

    expect(find.text('Popular TV Shows'), findsOneWidget);
  });
}
