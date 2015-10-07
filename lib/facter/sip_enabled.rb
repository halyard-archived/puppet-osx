Facter.add('sip_enabled') do
  confine :osfamily => 'Darwin'

  def csrutil
    '/usr/bin/csrutil'
  end

  def sip_enabled?
    return false unless File.exist? csrutil
    case `#{csrutil} status 2>&1`.split.last
    when 'enabled.'
      true
    when 'disabled.'
      false
    else
      fail('Failed to determine SIP state')
    end
  end

  setcode do
    sip_enabled?
  end
end
