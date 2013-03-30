# -*- coding: utf-8 -*-
rails # Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :books, 'Books', pages_path
    primary.item :music, 'Music', pages_path
    primary.item :dvds, 'Dvds', pages_path
  end
end