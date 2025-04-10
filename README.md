# Movable Red Square 

A simple Flutter app that demonstrates basic animation and state management by moving a red square between the left and right edges of the screen using buttons.

---

## Preview

The square starts centered. Press "To Left" or "To Right" to move it with a smooth 1-second animation. Buttons are disabled appropriately during movement or when at the screen edges.

---

## Features

- Red square starts centered.
- Moves to left or right edge with buttons.
- 1-second smooth animation (`AnimatedPositioned`).
- Buttons are disabled:
    - While the square is moving
    - When already at an edge
- Clean and readable logic using `get` properties.
- Works in DartPad (no extra files or assets required).

---

## Run It in DartPad

You can copy and paste the code into [DartPad](https://dartpad.dev) and hit "Run". Make sure to select **Flutter** on the left panel.

> DartPad supports Flutter, but only single-file apps — this app is fully compatible.
