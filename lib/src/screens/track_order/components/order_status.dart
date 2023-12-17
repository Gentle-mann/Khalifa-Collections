import 'package:flutter/material.dart';

import 'step_title.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({
    super.key,
  });

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  final steps = [
    const Step(
      title: StepTitle(
        icon: 'assets/icons/order.svg',
        title: 'Order Placed',
      ),
      subtitle: Text('2 Aug, 2023. 16:25 WAT'),
      content: SizedBox.shrink(),
      isActive: true,
    ),
    const Step(
      title: StepTitle(
        icon: 'assets/icons/progress.svg',
        title: 'In progress',
        isIconLarge: true,
      ),
      subtitle: Text('2 Aug, 2023. 16:45 WAT'),
      content: SizedBox.shrink(),
      isActive: true,
    ),
    const Step(
      title: StepTitle(
        icon: 'assets/icons/shipped.svg',
        title: 'Shipped',
      ),
      subtitle: Text('Expected: 3 Aug, 2023. 12:30 WAT'),
      content: SizedBox.shrink(),
    ),
    const Step(
      title: StepTitle(
        icon: 'assets/icons/delivered.svg',
        title: 'Delivered',
      ),
      subtitle: Text('Expected: 7 Aug, 2023. 16:00 WAT'),
      content: SizedBox.shrink(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: steps,
      currentStep: 0,
      controlsBuilder: controlsBuilder,
      stepIconBuilder: stepIconBuilder,
    );
  }

  Widget controlsBuilder(BuildContext context, ControlsDetails details) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: SizedBox.shrink(),
    );
  }

  Widget? stepIconBuilder(int stepIndex, StepState stepState) {
    return const Icon(
      Icons.check,
      color: Colors.white,
      size: 15,
    );
  }
}
