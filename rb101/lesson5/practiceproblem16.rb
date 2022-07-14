def uuid
  uuid = ""
  chars = []
  (0..9).each { |num| chars << num.to_s }
  ('a'..'f').each { |letter| chars << letter } 
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += chars.sample }
    uuid += '-' unless index >= sections.size - 1
  end
  uuid
end

p uuid