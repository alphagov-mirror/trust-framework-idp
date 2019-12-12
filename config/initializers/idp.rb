IDP = YAML.load_file("#{Rails.root.to_s}/config/idps/#{ENV.fetch('IDP')}.yml")
