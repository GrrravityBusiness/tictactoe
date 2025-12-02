import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/core/widgets/painter/x_o_painters.dart';

void main() {
  group('Painter Widget Tests', () {
    group('XPainter', () {
      testWidgets('XPainter renders correctly', (WidgetTester tester) async {
        // Arrange
        const testKey = Key('XPainterTest');
        const testColor = Colors.red;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomPaint(
                key: testKey,
                painter: XPainter(
                  color: testColor,
                  strokeWidth: 5,
                ),
                size: const Size(100, 100),
              ),
            ),
          ),
        );

        // Act
        final customPaintFinder = find.byKey(testKey);
        final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
        final painter = customPaintWidget.painter as XPainter?;

        // Assert
        expect(customPaintFinder, findsOneWidget);
        expect(painter!.color, testColor);
      });
    });

    group('OPainter', () {
      testWidgets('OPainter renders correctly', (WidgetTester tester) async {
        // Arrange
        const testKey = Key('OPainterTest');
        const testColor = Colors.blue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomPaint(
                key: testKey,
                painter: OPainter(
                  color: testColor,
                  strokeWidth: 5,
                ),
                size: const Size(100, 100),
              ),
            ),
          ),
        );

        // Act
        final customPaintFinder = find.byKey(testKey);
        final customPaintWidget = tester.widget<CustomPaint>(customPaintFinder);
        final painter = customPaintWidget.painter as OPainter?;

        // Assert
        expect(customPaintFinder, findsOneWidget);
        expect(painter!.color, testColor);
      });
    });

    group('XorOAnimatedPaint', () {
      testWidgets('XorOAnimatedPaint renders XPainter when xOrO is 1', (
        WidgetTester tester,
      ) async {
        // Arrange
        const testKey = Key('XorOAnimatedPaintTest');

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: XorOAnimatedPaint(
                key: testKey,
                xOrO: 1,
                strokeWidth: 5,
              ),
            ),
          ),
        );

        // Act
        final animatedPaintFinder = find.byKey(testKey);

        // Assert
        expect(animatedPaintFinder, findsOneWidget);
        final widget = tester.widget<XorOAnimatedPaint>(animatedPaintFinder);
        expect(widget.xOrO, 1);
        expect(widget.strokeWidth, 5);

        // Check that the widget is visible
        expect(widget, isA<XorOAnimatedPaint>());
        // Check that the widget is not hidden
        expect(widget.xOrO != -1, isTrue);

        // Check that XPainter is in the tree
        final customPaints = find.byType(CustomPaint);
        var hasXPainter = false;
        for (final element in customPaints.evaluate()) {
          final customPaint = element.widget as CustomPaint;
          if (customPaint.painter is XPainter) {
            hasXPainter = true;
            break;
          }
        }
        expect(hasXPainter, isTrue);
      });

      testWidgets(
        'XorOAnimatedPaint does not renders OPainter when xOrO is 1',
        (
          WidgetTester tester,
        ) async {
          // Arrange
          const testKey = Key('XorOAnimatedPaintTest');

          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: XorOAnimatedPaint(
                  key: testKey,
                  xOrO: 1,
                  strokeWidth: 5,
                ),
              ),
            ),
          );

          // Act
          final animatedPaintFinder = find.byKey(testKey);

          // Assert
          expect(animatedPaintFinder, findsOneWidget);
          final widget = tester.widget<XorOAnimatedPaint>(animatedPaintFinder);
          expect(widget.xOrO, 1);
          expect(widget.strokeWidth, 5);

          // Check that the widget is visible
          expect(widget, isA<XorOAnimatedPaint>());
          // Check that the widget is not hidden
          expect(widget.xOrO != -1, isTrue);

          // Check that XPainter is in the tree
          final customPaints = find.byType(CustomPaint);
          var hasOPainter = false;
          for (final element in customPaints.evaluate()) {
            final customPaint = element.widget as CustomPaint;
            if (customPaint.painter is OPainter) {
              hasOPainter = true;
              break;
            }
          }
          expect(hasOPainter, isFalse);
        },
      );

      testWidgets('XorOAnimatedPaint renders OPainter when xOrO is 0', (
        WidgetTester tester,
      ) async {
        // Arrange
        const testKey = Key('XorOAnimatedPaintTest');

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: XorOAnimatedPaint(
                key: testKey,
                xOrO: 0,
                strokeWidth: 5,
              ),
            ),
          ),
        );

        // Act
        final animatedPaintFinder = find.byKey(testKey);

        // Assert
        expect(animatedPaintFinder, findsOneWidget);
        final widget = tester.widget<XorOAnimatedPaint>(animatedPaintFinder);
        expect(widget.xOrO, 0);

        // Check that the widget is visible
        expect(widget, isA<XorOAnimatedPaint>());
        // Check that the widget is not hidden
        expect(widget.xOrO != -1, isTrue);

        // Check that XPainter is in the tree
        final customPaints = find.byType(CustomPaint);
        var hasOPainter = false;
        for (final element in customPaints.evaluate()) {
          final customPaint = element.widget as CustomPaint;
          if (customPaint.painter is OPainter) {
            hasOPainter = true;
            break;
          }
        }
        expect(hasOPainter, isTrue);
      });

      testWidgets(
        'XorOAnimatedPaint does not renders XPainter when xOrO is 0',
        (
          WidgetTester tester,
        ) async {
          // Arrange
          const testKey = Key('XorOAnimatedPaintTest');

          await tester.pumpWidget(
            const MaterialApp(
              home: Scaffold(
                body: XorOAnimatedPaint(
                  key: testKey,
                  xOrO: 0,
                  strokeWidth: 5,
                ),
              ),
            ),
          );

          // Act
          final animatedPaintFinder = find.byKey(testKey);

          // Assert
          expect(animatedPaintFinder, findsOneWidget);
          final widget = tester.widget<XorOAnimatedPaint>(animatedPaintFinder);
          expect(widget.xOrO, 0);

          // Check that the widget is visible
          expect(widget, isA<XorOAnimatedPaint>());
          // Check that the widget is not hidden
          expect(widget.xOrO != -1, isTrue);

          // Check that XPainter is in the tree
          final customPaints = find.byType(CustomPaint);
          var hasXPainter = false;
          for (final element in customPaints.evaluate()) {
            final customPaint = element.widget as CustomPaint;
            if (customPaint.painter is XPainter) {
              hasXPainter = true;
              break;
            }
          }
          expect(hasXPainter, isFalse);
        },
      );

      testWidgets('XorOAnimatedPaint Painters are hidden when xOrO is -1', (
        WidgetTester tester,
      ) async {
        // Arrange
        const testKey = Key('XorOAnimatedPaintTest');

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: XorOAnimatedPaint(
                key: testKey,
                xOrO: -1,
                strokeWidth: 5,
              ),
            ),
          ),
        );

        // Act
        final animatedPaintFinder = find.byKey(testKey);

        // Assert
        expect(animatedPaintFinder, findsOneWidget);
        final widget = tester.widget<XorOAnimatedPaint>(animatedPaintFinder);
        expect(widget.xOrO, -1);
        // Check that the widget is visible
        expect(widget, isA<XorOAnimatedPaint>());

        // Check that XPainter is in the tree
        final customPaints = find.byType(CustomPaint);
        var hasXPainter = false;
        for (final element in customPaints.evaluate()) {
          final customPaint = element.widget as CustomPaint;
          if (customPaint.painter is XPainter) {
            hasXPainter = true;
            break;
          }
        }
        expect(hasXPainter, isFalse);
        var hasOPainter = false;
        for (final element in customPaints.evaluate()) {
          final customPaint = element.widget as CustomPaint;
          if (customPaint.painter is OPainter) {
            hasOPainter = true;
            break;
          }
        }
        expect(hasOPainter, isFalse);
      });
    });
  });
}
