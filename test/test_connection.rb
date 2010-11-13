require 'helper'

#require 'connection/test_login'
#require 'connection/test_get_available_modules'
#require 'connection/test_get_module_fields'
#require 'connection/test_get_entry'
#require 'connection/test_get_entries'
#require 'connection/test_get_entry_list'

class TestConnection < Test::Unit::TestCase
  context "A SugarCRM::Connection instance" do
    setup do
      @connection = SugarCRM::Connection.new(URL, USER, PASS)
    end
    should "retrieve the list of available modules" do
      assert_instance_of Array, SugarCRM.modules
      assert_instance_of SugarCRM::Module, SugarCRM.modules[0]
    end
    should "create sub-classes by module name" do
      @connection = SugarCRM::Connection.new(URL, USER, PASS, {:register_modules => true})
      assert SugarCRM.const_defined? "User"
    end
  end
end