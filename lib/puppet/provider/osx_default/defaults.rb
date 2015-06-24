require 'puppet/util/errors'
require 'puppet/util/execution'

Puppet::Type.type(:osx_default).provide :defaults do
  include Puppet::Util::Execution
  include Puppet::Util::Errors

  def exists?
    type_call(:exists?)
  end

  def destroy
    run(:delete, key_string)
  end

  def create
    run :write, "#{key_string} #{type_call(:value_string)}"
  end

  private

  def type_call(call)
    type_sym = "#{type}_#{call}".to_sym
    return send(type_sym) if respond_to?(type_sym, true)
    send "generic_#{call}".to_sym
  end

  def run(cmd, string)
    `defaults #{host} #{cmd} #{string} 2>/dev/null`
  end

  def read
    run(:read, key_string).rstrip
  end

  def read_type
    run(:'read-type', key_string).split.last
  end

  def host
    return @host if @host
    @host = case @resource[:host]
            when /^(current|currentHost)$/
              '-currentHost'
            when nil
              ''
            else
              "-host #{@resource[:host]}"
            end
  end

  def domain
    @domain ||= @resource[:domain]
  end

  def key
    @key ||= @resource[:key]
  end

  def value
    @value ||= @resource[:value]
  end

  def type
    @type ||= @resource[:type].to_s
  end

  def key_string
    "#{domain} #{key}"
  end

  def generic_exists?
    read == value.to_s && read_type == type
  end

  def dict_exists?
    return false unless read_type == 'dict'
    false
  end

  def generic_value_string
    "-#{type} #{value}"
  end

  def dict_value_string
    '-dict ' + value.map { |k, t, v| "#{k} -#{t} '#{v}'" }.join(' ')
  end
end
