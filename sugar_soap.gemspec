# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sugar_soap}
  s.version = "0.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Caroo GmbH"]
  s.date = %q{2011-04-01}
  s.description = %q{FIX (describe your package)}
  s.email = ["dev@pkw.de"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "lib/sugar_soap.rb", "lib/sugar_soap/attributes_to_name_value_list_mapper.rb", "lib/sugar_soap/client.rb", "lib/sugar_soap/stub_client.rb", "sugar_soap.gemspec", "test/sugar_crm.wsdl", "test/test_attributes_to_name_value_list_mapper.rb", "test/test_helper.rb", "test/test_sugar_soap_client.rb"]
  s.homepage = %q{http://www.pkw.de}
  s.post_install_message = %q{
For more information on sugar_soap, see http://sugar_soap.rubyforge.org

NOTE: Change this information in PostInstall.txt 
You can also delete it if you don't want it.


}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{sugar_soap}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{The Sugar SOAP Client Gem provides a SOAP adapter to the Sugar CRM System of pkw.de. One can create and update entries of the Sugar module 'Accounts' with this client library. Login is provided, too of course.}
  s.test_files = ["test/test_attributes_to_name_value_list_mapper.rb", "test/test_helper.rb", "test/test_sugar_soap_client.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.5.3"])
      s.add_development_dependency(%q<test-unit>, [">= 2.0.7"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<hoe>, [">= 2.9.2"])
    else
      s.add_dependency(%q<newgem>, [">= 1.5.3"])
      s.add_dependency(%q<test-unit>, [">= 2.0.7"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<hoe>, [">= 2.9.2"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.5.3"])
    s.add_dependency(%q<test-unit>, [">= 2.0.7"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<hoe>, [">= 2.9.2"])
  end
end
