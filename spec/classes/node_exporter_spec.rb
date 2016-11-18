require 'spec_helper'

describe 'prometheus::node_exporter' do
  on_supported_os.each do |os, facts|
    context "with defaults on #{os}" do
      let(:facts) do
        facts.merge({:puppetmaster => 'localhost.localdomain'})
      end
      it { should compile.with_all_deps }
      it { should contain_class('prometheus::node_exporter') }
      it { should contain_class('prometheus::node_exporter::config') }
      it { should contain_class('prometheus::node_exporter::install') }
      it { should contain_class('prometheus::node_exporter::service') }
    end
  end
end
