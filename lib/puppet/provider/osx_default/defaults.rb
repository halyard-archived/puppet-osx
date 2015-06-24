require 'puppet/util/errors'
require 'puppet/util/execution'

Puppet::Type.type(:osx_default).provide :defaults do
  include Puppet::Util::Execution
  include Puppet::Util::Errors

  def exists?
    p @resource[:type]
    type_sym = "#{type}_exists?".to_sym
    return generic_exists? unless respond_to? type_sym
    send(type_sym)
  end

  def destroy
  end

  def create
  end

  private

  def cmd(string)
    `defaults #{string}`
  end

  def read(domain, key)
  end

  def generic_exists?
    defaults read NSGlobalDomain com.apple.sound.beep.feedback
  end

  def host
  end
end
