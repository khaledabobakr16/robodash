import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:robodash/presentation/features/control/widgets/command_button.dart';
import 'package:robodash/core/utils/responsive.dart';

void main() {
  testWidgets('CommandButton triggers onPressed', (tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            final responsive = Responsive.of(context);
            return Scaffold(
              body: CommandButton(
                label: 'Forward',
                backGroundcolor: Colors.green,
                responsive: responsive,
                onPressed: () => pressed = true,
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Forward'));
    await tester.pumpAndSettle();

    expect(pressed, true);
  });
}
