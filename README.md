# Example

An example of NestedScrollView allowing sync multiple ScrollController.

## Getting Started

This project is just showing how work my Custom Scroll Physics for multiple ScrollController inside an NestedScrollView.

<br>

| Default Physics without Controller | Default Physics with Controller | Custom Physics with Controller |
| --| --- | --- |
| <img src="https://user-images.githubusercontent.com/74125222/232683101-094b7adf-375d-40f0-bccf-971588092e30.gif" width="100%"> | <img src="https://user-images.githubusercontent.com/74125222/232683174-8f7a5017-4ca5-40ab-9dcc-d7bca973a0d5.gif" width="100%"> | <img src="https://user-images.githubusercontent.com/74125222/232683324-72927cab-84bd-4467-8054-3b07eb1418cf.gif" width="100%"> |


## NestedScrollControllerPhysics:
``` dart
class NestedScrollControllerPhysics extends ScrollPhysics {
  final ScrollController? parentController;
  const NestedScrollControllerPhysics({this.parentController, super.parent});

  @override
  NestedScrollControllerPhysics applyTo(ScrollPhysics? ancestor) {
    return NestedScrollControllerPhysics(parentController: parentController, parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if (parentController == null) {
      return super.applyPhysicsToUserOffset(position, offset);
    }

    final double scrollPixels = position.pixels;
    final double parentScrollOffset = parentController!.offset;
    final double parentMaxScrollExtent = parentController!.position.maxScrollExtent;

    if (parentScrollOffset < parentMaxScrollExtent && offset.isNegative) {
      parentController!.jumpTo(parentScrollOffset - offset);
      return 0.0;
    } else if (scrollPixels == 0.0 && !offset.isNegative) {
      parentController!.jumpTo(parentScrollOffset - offset);
    }
    return super.applyPhysicsToUserOffset(position, offset);
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (parentController == null) {
      return super.applyBoundaryConditions(position, value);
    }

    final double offset = value - position.pixels;
    final double parentScrollOffset = parentController!.offset;
    final double parentMaxScrollExtent = parentController!.position.maxScrollExtent;

    if (parentScrollOffset < parentMaxScrollExtent) {
      parentController!.jumpTo(parentScrollOffset + offset);
    } else if (value <= 0.0 && parentController!.position.atEdge) {
      parentController!.animateTo(0, duration: const Duration(milliseconds: 200), curve: Curves.decelerate);
    }

    return super.applyBoundaryConditions(position, value);
  }
}
```