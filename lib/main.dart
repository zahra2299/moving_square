import 'package:flutter/material.dart';

void main() {
  runApp(const MovingSquareApp());
}

class MovingSquareApp extends StatelessWidget {
  const MovingSquareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MovingSquareScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
/// The page that displays the movable square.
class MovingSquareScreen extends StatefulWidget {
  const MovingSquareScreen({super.key});

  @override
  State<MovingSquareScreen> createState() => _MovingSquareScreenState();
}

class _MovingSquareScreenState extends State<MovingSquareScreen>
    with SingleTickerProviderStateMixin {
  /// The left offset of the square (used for positioning).
  double leftPosition = 0.0;
  /// Width of the square in pixels.
  double squareSize = 100.0;
  /// Duration of the animation.
  static const Duration _duration = Duration(seconds: 1);
  /// Whether the square is currently moving.
  bool isMoving = false;
  /// The width of the screen.
  late double screenWidth;

  /// Whether the square is currently at the left edge.
  bool get _isAtLeft => leftPosition <= 0;
  /// Whether the square is currently at the right edge.
  bool get _isAtRight => leftPosition >= screenWidth - squareSize;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //to get screen width.
    screenWidth = MediaQuery.of(context).size.width;
    // Center the square horizontally when the app starts.
    leftPosition = (screenWidth - squareSize) / 2;
  }

  /// Moves the square either left or right depending on [toRight].
  void moveSquare(bool toRight) {
    // Determine the destination position.
    final target = toRight ? screenWidth - squareSize : 0.0;
    // Set the state to moving.
    setState(() => isMoving = true);
    // Trigger the animation by updating the position.
    setState(() => leftPosition = target);
    // Re-enable buttons after animation ends.
    setState(() => isMoving = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Moving Square")),
      body: Stack(
        children: [
          // The animated square positioned in the stack.
          AnimatedPositioned(
            duration: _duration,
            left: leftPosition,
            top: MediaQuery.of(context).size.height / 3 - squareSize / 3,
            child: Container(
              width: squareSize,
              height: squareSize,
              color: Colors.red,
            ),
          ),
          // Positioned row of control buttons at the bottom.
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // "To Left" button; disabled if already at left or animating.
                ElevatedButton(
                  onPressed: (!isMoving && !_isAtLeft)
                      ? () => moveSquare(false)
                      : null,
                  child: const Text("To Left"),
                ),
                // "To Right" button; disabled if already at right or animating.
                ElevatedButton(
                  onPressed: (!isMoving && !_isAtRight)
                      ? () => moveSquare(true)
                      : null,
                  child: const Text("To Right"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
