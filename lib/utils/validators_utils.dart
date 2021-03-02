class ValidatorsUtils {
  static const String _EMPTY_FIELD_MESSAGE = 'No puede ser vacío';

  static String validateEmpty(String value) {
    if (value.isEmpty) {
      return _EMPTY_FIELD_MESSAGE;
    }
    return null;
  }

  static validateEmptyOrDouble(value) {
    if (value.isEmpty) {
      return _EMPTY_FIELD_MESSAGE;
    }
    if (double.tryParse(value) == null) {
      return 'Valor no válido';
    }
    return null;
  }
}
