Pod::Spec.new do |s|
  s.name             = 'APIVerveSanctionsScreening'
  s.version          = '1.2.3'
  s.summary          = 'Sanctions Screening is an OFAC API that checks a person, company or vessel name against the US Treasury OFAC SDN and Consolidated lists,...'
  s.description      = <<-'DESC'
Sanctions Screening is an OFAC API that checks a person, company or vessel name against the US Treasury OFAC SDN and Consolidated lists, the UN Security Council Consolidated List, the EU consolidated financial sanctions list and the UK Sanctions List. It returns scored JSON matches with the list each hit came from, aliases, dates of birth, addresses and sanctions programs so you can decide whether to block or review.

This iOS/macOS SDK provides a convenient way to access the Sanctions Screening from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/sanctionscreening?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/sanctionscreening-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveSanctionsScreening/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
