module MyLife::System
  DATE_CAPTURE = 't(?:oday)?|y(?:esterday)?|\d+(?: days ago)?'

  def get_date(args)
    args.join(" ") =~ /^(#{DATE_CAPTURE})/
    capt = $1

    puts ">#{args.join(" ")}<"
    puts args.join(" ") =~ /^(#{DATE_CAPTURE})/

    print_opts && exit unless capt

    if capt =~ /^(\d+)/
      $1.to_i.days.ago.to_date
    elsif capt =~ /^y/
      1.day.ago.to_date
    else
      Date.today
    end
  end

  def print_opts
    puts "Usage: mylife ( #{DATE_CAPTURE.gsub(/\|/, " | ")} )"
    true
  end

  def editor_cmd
    system_editor = `echo $EDITOR`.strip
    system_editor.empty? ? "vim" : system_editor
  end
end
