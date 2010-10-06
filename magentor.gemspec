# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{magentor}
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Preston Stuteville"]
  s.date = %q{2010-10-06}
  s.email = %q{preston.stuteville@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "MIT-LICENSE",
     "README.rdoc",
     "Rakefile",
     "TODOS",
     "VERSION",
     "init.rb",
     "lib/magento/base.rb",
     "lib/magento/category.rb",
     "lib/magento/category_attribute.rb",
     "lib/magento/connection.rb",
     "lib/magento/country.rb",
     "lib/magento/customer.rb",
     "lib/magento/customer_address.rb",
     "lib/magento/customer_group.rb",
     "lib/magento/inventory.rb",
     "lib/magento/invoice.rb",
     "lib/magento/order.rb",
     "lib/magento/product.rb",
     "lib/magento/product_attribute.rb",
     "lib/magento/product_attribute_set.rb",
     "lib/magento/product_link.rb",
     "lib/magento/product_media.rb",
     "lib/magento/product_stock.rb",
     "lib/magento/product_tier_price.rb",
     "lib/magento/product_type.rb",
     "lib/magento/region.rb",
     "lib/magento/shipment.rb",
     "lib/magentor.rb",
     "magentor.gemspec"
  ]
  s.homepage = %q{http://github.com/pstuteville/magentor}
  s.rdoc_options = ["--main", "README.rdoc", "--inline-source", "--line-numbers"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby wrapper for the Magento xmlrpc api}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
