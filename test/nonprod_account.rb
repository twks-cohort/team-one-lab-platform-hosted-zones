require 'awspec'

describe route53_hosted_zone('cdicohorts.one.') do
  it { should exist }
end

describe route53_hosted_zone('nonprod-us-east-2.cdicohorts.one.') do
  it { should exist }
end

