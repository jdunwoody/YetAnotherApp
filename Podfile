# Uncomment this line to define a global platform for your project
# platform :ios, '6.0'

target 'YetAnotherApp' do

end

target 'YetAnotherAppTests' do
  pod 'Specta', '~> 0.5'
  pod 'Expecta',     '~> 0.3'
  pod 'OCMock',      '~> 2.2'
  pod 'OCHamcrest',  '~> 3.0'
  pod 'OCMockito',   '~> 1.0'
  pod 'LRMocky',     '~> 0.9'
end

target 'Acceptance Tests', :exclusive => true do
  pod 'KIF', '~> 3.0', :configurations => ['Debug']
  pod 'Specta', '~> 0.5'
  pod 'Expecta',     '~> 0.3'
end
