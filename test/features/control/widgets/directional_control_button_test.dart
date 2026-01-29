import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:robodash/presentation/features/control/widgets/directional_control_button.dart';
import 'package:robodash/core/utils/responsive.dart';

void main() {
  testWidgets('DirectionalControlButton triggers onPressed', (tester) async {
    String? action;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            final responsive = Responsive.of(context);

            return DirectionalControlButton(
              label: 'Left',
              action: 'left',
              color: Colors.red,
              size: 50,
              responsive: responsive,
              onPressed: (a) => action = a,
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Left'));
    await tester.pumpAndSettle();
    expect(action, 'left');
  });
}
