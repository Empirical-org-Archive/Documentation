module API
  def config
    @config ||= YAML.load(open('https://raw.githubusercontent.com/empirical-org/Compass-API/master/lib/quill/api.yml'))
  end

  extend self
end
