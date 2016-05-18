RSpec::Matchers.define :match_response_schema do |_resource|
  match do |response|
    schema = JSON.dump(YAML.load(File.open("#{Rails.root}/docs/schema/schemata/jwt.yml").read))
    data = JSON.parse(response.body)
    JSON::Validator.fully_validate(schema, data)
  end
end
