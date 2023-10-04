require 'awspec'

describe route53_hosted_zone('cdicohorts-one.com.') do
  it { should exist }
end

describe route53_hosted_zone('nonprod-us-east-2.cdicohorts-one.com.') do
  it { should exist }
end

