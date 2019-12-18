# logrotate  install

logrotate_package = 'logrotate'
logrotate_conf_file = '/etc/logrotate.conf'

control 'install-01' do
  impact 1.0
  title 'Logrotate install'
  desc 'Logrotate should be installed'
  describe package(logrotate_package) do
    it { should be_installed }
  end
end

control 'install-02' do
  impact 1.0
  title 'Logrotate file'
  desc 'Logrotate file shoud be only readable and writable by root'
  describe file(logrotate_conf_file) do
    it { should exist }
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_writable.by('owner') }
    it { should_not be_executable }
    it { should be_writable.by('owner') }
    it { should_not be_writable.by('group') }
    it { should_not be_writable.by('other') }
  end
end
