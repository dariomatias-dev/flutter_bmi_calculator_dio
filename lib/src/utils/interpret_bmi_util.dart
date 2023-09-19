String interpretBmiUtil(double bmi) {
  if (bmi < 16) {
    return 'Magreza grave';
  } else if (bmi < 17) {
    return 'Magreza moderada';
  } else if (bmi < 18.5) {
    return 'Magreza leve';
  } else if (bmi < 25) {
    return 'Saudável';
  } else if (bmi < 30) {
    return 'Sobrepeso';
  } else if (bmi < 35) {
    return 'Obesidade I';
  } else if (bmi < 40) {
    return 'Obesidade II (severa)';
  }

  return 'Obesidade III (mórbida)';
}