require 'colored'
require 'rake/clean'
require 'rubygems'
require 'yaml'

Dir.glob('tasks/*.rb').each { |ruby_file| load ruby_file }
Dir.glob('tasks/*.rake').each { |rake_task| load rake_task }

$scheme = 'FX'
$configuration = 'Debug'

task default: [:build]

task setup: [:clean] do |t|
  mkdir_p BUILD_DIR
  mkdir_p REPORT_DIR
end

desc 'Clean the project of generated files'
task :clean do |t|
	xcodebuild(commands: 'clean', pretty: '-t', task: t)
	rm_rf BUILD_DIR
end

desc 'Build FX'
task :build do |t|
	xcodebuild(commands: "-sdk iphonesimulator clean build", task: t)
end

desc 'Run full Xcode tests on all devices'
task :test do |t|
	pp "Testing on all devices: #{DEVICE_HOSTS}"
	DEVICE_HOSTS.each do |device_string|
    device = get_simulator_device(device_string)
    prepare_simulator device
    begin
      commands = "-sdk iphonesimulator -destination '#{device_string}' clean test"
      xcodebuild(commands: commands, pretty: "--test #{$xcpretty_args}", log_prefix: "#{device[:type].gsub(' ', '_')}")
    ensure
      name_results device
      shutdown_the_simulator if something_booted?
    end
	end
end

desc 'Continuous Integration reports'
task ci: [:install_provisioning_profiles] do |t|
	`xcodebuild -showsdks`
	$xcpretty_args = '--report junit --report html'
	Rake::Task['clean'].invoke
	Rake::Task['build'].invoke
	Rake::Task['test'].invoke
end

desc 'Install Provisioning Profiles need for development and deployment'
task :install_provisioning_profiles do |t|
	install_provisioning_profiles
end

desc 'Regenerate storyboard identifiers in code. Only includes identifiers with prefix `FX`.'
task :storyboard_ids do |t|
	`bundle exec sbconstants FX/Constants/_FXStoryboardIdentifiers.h -s FX/Resources/Storyboards/ -t Support/SBConstants-Templates/ --prefix=FX`
end

desc 'Setup Xcode project sort git hook'
task :sort_setup do |t|
	`Support/setup-project-file-sorting.sh 1>/dev/null`
end

desc 'Sort Xcode project file'
task sort: [:sort_setup] do |t|
	`Support/manual-sort-project-file.sh 1>/dev/null`
	pp 'pbxproj sorted'
end

desc 'Install ANZ FX Color palette'
task :install_colors do |t|
	colors_source = 'FX/Resources/ANZ-FX-Colors.clr'
	colors_path = "#{Dir.home}/Library/Colors"
	mkdir_p colors_path
	cp colors_source, "#{colors_path}/ANZ-FX-Colors.clr"
end

desc 'Generate code documenation. Compatible with Xcode.'
task :docset do |t|
	if system('appledoc --version >/dev/null 2>&1')
		`appledoc --verbose 1 .`
		pp 'Documenation generated to Docset/'
	else
		pe '`appledoc` not installed. Check README.md for install instructions'
	end
end

desc 'Run the Unit Tests on one simulator (not all of them!)'
task unitTests: [:setup] do |t|
  xcodebuild(commands:  "#{TEST_BUILD_CONFIG} clean test", configuration: 'Debug', pretty:  '-t', task: t)
end

desc 'Generate the code coverage report from the most recent test run'
task :coverage do
  mkdir_p REPORT_DIR
  generate_coverage_report
end

desc 'Calculate the latest coverage and view the HTML results. This runs the Unit tests on the simulator, so it can take a few minutes to run.'
task :showCoverage do | t |
  Rake::Task["clean"].invoke
  Rake::Task["unitTests"].invoke
  Rake::Task["coverage"].invoke
  sh "open build/reports/gcovr.html"
end

desc 'Build for 32bit and 64bit'
task james: [:setup] do |t|
	# ONLY_ACTIVE_ARCH=NO will build all supported arch
	xcodebuild(commands: "-sdk iphonesimulator ONLY_ACTIVE_ARCH=NO build", task: t)
end

desc 'Run Rubocop to lint the Ruby code. (At the moment only lints the calabash/cucumber steps)'
task :rubocop do |task|
  executeShellCommand "rubocop features/step_definitions"
end

desc 'Add new localized strings to Localizable.strings file'
task :genstrings do |t|
	genstrings('FX', 'FX/Resources')
end
