double calculateHeightInMeters(int feet, int inches) {
  return (feet * 0.3048) + (inches * 0.0254);
}

Map<String, dynamic> calculateBMI(double weight, double height) {
  final bmi = weight / (height * height);
  final category = bmi < 18.5
      ? 'Underweight'
      : bmi < 24.9
          ? 'Normal weight'
          : bmi < 29.9
              ? 'Overweight'
              : 'Obesity';

  return {'bmi': bmi, 'category': category};
}

Map<String, dynamic>? preparePatientData({
  required String name,
  required String gender,
  required int age,
  required double weight,
  required int feet,
  required int inches,
}) {
  if (name.isNotEmpty && gender.isNotEmpty && weight > 0) {
    final height = calculateHeightInMeters(feet, inches);

    if (height > 0) {
      final bmiData = calculateBMI(weight, height);
      return {
        'name': name,
        'gender': gender,
        'age': age,
        'weight': weight,
        'height': height,
        'bmi': bmiData['bmi'],
        'category': bmiData['category'],
      };
    }
  }
  return null;
}
