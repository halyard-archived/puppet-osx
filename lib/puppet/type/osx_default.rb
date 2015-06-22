Puppet::Type.newtype(:osx_default) do
  @doc = ""

  ensurable do
    defaultvalues
    defaultto :present
  end

  newparam(:name) do
    desc 'Description of option'
  end

  newparam(:host) do
    desc 'Host to operate on'
    newvalues(nil, 'currentHost')
  end

  newparam(:domain) do
    desc 'Domain to operate on'
  end

  newparam(:key) do
    desc 'Key to operate on'
  end

  newparam(:value) do
    desc 'Value to use for key'
  end

  newparam(:type) do
    desc 'Type for key'
    newvalues(:bool, :int, :dict, :string)
  end
end
