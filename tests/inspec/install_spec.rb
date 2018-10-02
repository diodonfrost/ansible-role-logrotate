# Fail2ban  install

logrotate_package = 'logrotate'
logrotate_crontab_job = '/usr/sbin/logrotate /etc/logrotate.conf'

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
