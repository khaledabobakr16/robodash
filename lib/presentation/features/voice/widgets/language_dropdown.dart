import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  final String selectedLanguage;
  final bool isListening;
  final Color primaryColor;
  final ValueChanged<String> onChanged;

  const LanguageDropdown({
    super.key,
    required this.selectedLanguage,
    required this.isListening,
    required this.primaryColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: primaryColor.withValues(alpha: 0.3)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: primaryColor,
          value: selectedLanguage,

          onChanged: isListening
              ? null
              : (String? newValue) {
                  if (newValue != null) {
                    onChanged(newValue);
                  }
                },
          items: const [
            DropdownMenuItem(value: 'en_US', child: Text('English')),
            DropdownMenuItem(value: 'ar_SA', child: Text('العربية')),
          ],
        ),
      ),
    );
  }
}
