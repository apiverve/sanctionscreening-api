/// Sanctions Screening API client for Dart/Flutter
///
/// Sanctions Screening is an OFAC API that checks a person, company or vessel name against the US Treasury OFAC SDN and Consolidated lists, the UN Security Council Consolidated List, the EU consolidated financial sanctions list and the UK Sanctions List. It returns scored JSON matches with the list each hit came from, aliases, dates of birth, addresses and sanctions programs so you can decide whether to block or review.
///
/// For more information, visit: https://apiverve.com/marketplace/sanctionscreening?utm_source=dart&utm_medium=referral&utm_content=readme
library apiverve_sanctionscreening;

export 'src/client.dart';
export 'src/models.dart';
