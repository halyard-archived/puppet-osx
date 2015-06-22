require 'puppet/util/errors'
require 'puppet/util/execution'

Puppet::Type.type(:osx_default).provide :defaults do
  include Puppet::Util::Execution
  include Puppet::Util::Errors

  def exists?
  end

  def destroy
  end

  def create
  end

  private
end
