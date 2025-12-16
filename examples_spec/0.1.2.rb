require 'rspec'


describe "example code" do
  let(:output) { `#{RbConfig.ruby} __TMPFILE__`.chomp }
  let(:rspec_methods) { [ 
        :as_null_object,
        :null_object?,
        :pretty_inspect,
        :pretty_print,
        :pretty_print_cycle,
        :pretty_print_inspect,
        :pretty_print_instance_variables,
        :received_message?,
        :should,
        :should_not,
        :should_not_receive,
        :should_receive,
        :stub,
        :stub_chain,
	    :to_json,
        :unstub,
    ]
  }
  let(:sorted_methods) { 1.methods.sort - rspec_methods }

  it "should sort the method list" do
    expect(eval(output)).to eq(sorted_methods)
  end 
end
