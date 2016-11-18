require 'spec_helper'

describe 'prometheus::alertmanager' do
  on_supported_os.each do |os, facts|
    context "with defaults on #{os}" do
      let(:facts) do
        facts.merge({:puppetmaster => 'localhost.localdomain'})
      end
      let :params do
        { :config        => {'hash'=>10},}
      end
      it { should compile.with_all_deps }
      it { should contain_class('prometheus::alertmanager') }
      it { should contain_class('prometheus::alertmanager::config') }
      it { should contain_class('prometheus::alertmanager::install') }
      it { should contain_class('prometheus::alertmanager::service') }
    end
  end
end
