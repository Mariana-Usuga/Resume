import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio_mariana/main.dart';

void main() {
  testWidgets('App loads and shows Mariana name', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text('Mariana'), findsOneWidget);
  });
}
