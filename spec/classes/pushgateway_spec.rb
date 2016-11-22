require 'spec_helper'

describe 'prometheus::pushgateway' do
  on_supported_os.each do |os, facts|
    context "with defaults on #{os}" do
      let(:facts) do
        facts.merge({:puppetmaster => 'localhost.localdomain'})
      end

      it { should compile.with_all_deps }
      it { should contain_class('prometheus::pushgateway') }
      it { should contain_class('prometheus::pushgateway::config') }
      it { should contain_class('prometheus::pushgateway::install') }
      it { should contain_class('prometheus::pushgateway::service') }
    end
  end
end
