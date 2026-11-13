import 'package:flutter_test/flutter_test.dart';
import 'package:tabungku_layout/main.dart';

void main() {
  testWidgets('RingkasanPage Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const TabungApp());

    expect(find.text('Ringkasan Tabungan'), findsOneWidget);

    expect(find.text('Tabungan Impian'), findsOneWidget);
    expect(find.text('Rp 15.750.000'), findsOneWidget);
    expect(find.text('Rp 25.000.000'), findsOneWidget);

    expect(find.text('Menabung'), findsOneWidget);
    expect(find.text('Tarik'), findsOneWidget);
    expect(find.text('Riwayat'), findsOneWidget);

    expect(find.text('Setoran Bulanan'), findsOneWidget);
    expect(find.text('Beli Laptop Kerja'), findsOneWidget);
  });
}
