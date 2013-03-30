SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :books, 'Books', aboboras_path
    primary.item :music, 'Music',aboboras_path
    primary.item :dvds, 'Dvds', aboboras_path
  end
end