import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class SanctionscreeningValidationException implements Exception {
  final List<String> errors;

  SanctionscreeningValidationException(this.errors);

  @override
  String toString() => 'SanctionscreeningValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Sanctions Screening API client.
///
/// For more information, visit: https://apiverve.com/marketplace/sanctionscreening?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [name] (required) - The person or company name to screen (3-300 characters, at most 15 words) [maxLength: 300]
/// * [threshold] - Minimum match score to return, between 0.5 and 1. Lower catches more names but returns more false positives. Values outside the range are clamped to 0.5 or 1
/// * [limit] - Maximum number of matches to return (1-50; values outside the range are clamped)
/// * [type] - Restrict screening to one entry type: individual, entity, vessel or aircraft. Any other value is ignored and every type is screened
/// * [lists] - Comma-separated list codes to screen (ofac_sdn, ofac_cons, un, eu, uk). Omit to screen every list. Unknown codes are ignored, and if none of the codes is valid every list is screened
class SanctionscreeningClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'name': ValidationRule(type: 'string', required: true, maxLength: 300),
    'threshold': ValidationRule(type: 'number', required: false),
    'limit': ValidationRule(type: 'number', required: false),
    'type': ValidationRule(type: 'string', required: false),
    'lists': ValidationRule(type: 'string', required: false),
  };

  SanctionscreeningClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/sanctionscreening',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [SanctionscreeningValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw SanctionscreeningValidationException(errors);
    }
  }

  /// Execute a request to the Sanctions Screening API.
  ///
  /// Parameters are validated before sending the request.
  Future<SanctionscreeningResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw SanctionscreeningException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: params.map((key, value) => MapEntry(key, value.toString())),
      );

      final response = await _httpClient.get(
        uri,
        headers: {
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return SanctionscreeningResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw SanctionscreeningException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw SanctionscreeningException('Resource not found');
      } else {
        throw SanctionscreeningException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is SanctionscreeningException) rethrow;
      throw SanctionscreeningException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Sanctions Screening API client.
class SanctionscreeningException implements Exception {
  final String message;

  SanctionscreeningException(this.message);

  @override
  String toString() => 'SanctionscreeningException: $message';
}
