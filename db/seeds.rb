file = ENV["TEXT_FILE"]

def seed_database(file)
  File.open(file).each_line.with_index do |line, index|
    l = Line.new
    l.line_text   = line.chomp
    l.line_index  = index.to_i + 1
    l.save!
  end
end

seed_database(file)