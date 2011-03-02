require 'rubygems'
require 'hoe'

Hoe.plugin :newgem
Hoe.plugins.delete :rubyforge
Hoe.plugins.delete :test
# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'sugar_soap' do
  self.developer('Caroo GmbH', 'dev@pkw.de')
  self.post_install_message = File.read('PostInstall.txt')
  self.changes              = self.paragraphs_of("History.txt", 0..1).join("\n\n")
  self.extra_dev_deps = [
    ['newgem', ">= #{::Newgem::VERSION}"],
    ['test-unit', ">= 2.0.7"],
    ['mocha']
  ]
  
  self.clean_globs |= %w[**/.DS_Store tmp *.log]
  self.summary = <<-SUMMARY
    The Sugar SOAP Client Gem provides a SOAP adapter to the Sugar CRM System
    of pkw.de. One can create and update entries of the Sugar module
    'Accounts' with this client library. Login is provided, too of course.
  SUMMARY
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

# TODO - want other tests/tasks run by default? Add them to the list
# remove_task :default
# task :default => [:spec, :features]

desc "Run unit tests"
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.ruby_opts << '-rubygems'
  t.test_files = FileList['test/test_*.rb']
  t.verbose = true
  t.warning = true
end