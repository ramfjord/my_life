module MyLife::CreateEntries
  PATH = "/Users/tramfjord/Workspace/my_life"
  TEMPLATE_PATH = "#{PATH}/records/template.yml"

  def blank_entry
    $blank_entry ||= File.read(TEMPLATE_PATH)
  end

  # returns a String of a blank entry made from a date and the template entry file
  def blank_entry_for(date)
    "date: '#{date}'\n\n#{blank_entry}"
  end

  # returns the path to the entry file for a date
  def date_path(date)
    "#{PATH}/records/#{date.to_date.to_s.gsub("-","/")}.yml"
  end

  # returns the directory part of a path to a date file on a given date
  def dir_part(date)
    date_path(date) =~ /^(.*)\/[^\/]*$/ && $1
  end

  # yields an open date file opened for writing and reading
  def date_file(date)
    `mkdir -p #{dir_part(date)}`
    f = File.open(date_path(date), "w+")
    yield f
    f.close
  end

  # writes the template to a new date file for (date
  def copy_entry_for(date)
    date_file(date.to_date) do |f|
      if f.size > 0 && !$overwrite
        $stderr.puts "File for #{date} already exists!" 
      else
        f.puts blank_entry_for(date)
      end
    end
  end

  def ensure_file_exists(date)
    puts "template_file: #{TEMPLATE_PATH}"
    puts "date_file: #{date_path(date)}"

    unless File.exists?(date_path(date))
      copy_entry_for(date)
    end
  end
end
