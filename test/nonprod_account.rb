require 'awspec'

describe route53_hosted_zone('twdps.digital.') do
  it { should exist }
end

describe route53_hosted_zone('sandbox-us-east-2.twdps.io.') do
  it { should exist }
end

describe route53_hosted_zone('sandbox-us-east-2.twdps.digital.') do
  it { should exist }
end

describe route53_hosted_zone('preview.twdps.digital.') do
  it { should exist }
end

describe route53_hosted_zone('preview.twdps.io.') do
  it { should exist }
end
