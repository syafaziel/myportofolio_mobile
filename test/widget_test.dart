import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('Portfolio app renders successfully', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MyApp(apiClient: ApiClient()));

    expect(find.byType(MyHomePage), findsOneWidget);
  });
}
