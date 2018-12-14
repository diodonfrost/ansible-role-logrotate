# Fail2ban  install

logrotate_package = 'logrotate'
logrotate_crontab_job = '/usr/sbin/logrotate /etc/logrotate.conf'
logrotate_crontab_job = '/usr/local/sbin/logrotate /etc/logrotate.conf' if os.name == 'freebsd'
logroate_configfile = '/etc/logrotate.conf'

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
  title 'Logrotate cron'
  desc 'Logrotate should be run periodically'
  describe crontab.commands(logrotate_crontab_job) do
    its('hours') { should cmp '2' }
    its('minutes') { should cmp '10' }
    its('weekdays') { should cmp '*' }
    its('days') { should cmp '*' }
    its('months') { should cmp '*' }
  end
end

control 'install-03' do
  impact 1.0
  title 'Logrotate file'
  desc 'Logrotate file shoud be only readable and writable by root'
    describe file(logroate_configfile) do
      it { should exist }
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_writable.by('owner') }
      it { should_not be_executable }
      it { should_not be_readable.by('group') }
      it { should_not be_readable.by('other') }
      it { should be_writable.by('owner') }
      it { should_not be_writable.by('group') }
      it { should_not be_writable.by('other') }
    end
  end
