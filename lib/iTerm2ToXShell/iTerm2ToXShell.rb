module ITerm2ToXShell
	def rgb_to_hex(rgb)
		'%02x%02x%02x' % rgb
	end

	def	iterm_to_rgb(clr)
		rkey = 'Red Component'
		bkey = 'Blue Component'
		gkey = 'Green Component'
		return (clr[rkey]*255).round, (clr[gkey]*255).round, (clr[bkey]*255).round
	end

	def	format_to_xshell(file_name, name, bg, fg, pallete_name, pallete)

		file = File.new(file_name, "w")

		file.write("[#{name}]\n")
		(0..15).each do |index|
			file.write("#{pallete_name[index]}=#{pallete[index].downcase}\n")
		end
		file.write("#{pallete_name[16]}=#{fg.downcase}\n")
		file.write("#{pallete_name[17]}=#{fg.downcase}\n")
		file.write("baground=#{bg.downcase}\n")

		file.write("[Names]\n")
		file.write("count=1\n")
		file.write("name0=#{name.capitalize}")

		file.close
	end

	def to_xshell(itermcolor, options)
		iterm_extend = File.extname(itermcolor)
		base_name = File.basename(itermcolor, iterm_extend)
		new_file = File.expand_path(File.join(options[:xcs_dir], base_name+options[:xcs_ext]))
		puts "Converting #{itermcolor} to #{new_file}......"

		plist = Plist::parse_xml(itermcolor)
		bg_hex = rgb_to_hex(iterm_to_rgb(plist['Background Color']))
		fg_hex = rgb_to_hex(iterm_to_rgb(plist['Foreground Color']))
		csr_hex = rgb_to_hex(iterm_to_rgb(plist['Cursor Color']))

		pallete_name =[
		"black(bold)",
		"red(bold)",
		"green(bold)",
		"yellow(bold)",
		"blue(bold)",
		"magenta(bold)",
		"cyan(bold)",
		"white(bold)",
		"black",
		"red",
		"green",
		"yellow",
		"blue",
		"magenta",
		"cyan",
		"white",
		"text(bold)",
		"text"
		]

		pallete_hex = []
		(0..15).each do |index|
			color_key = "Ansi #{index} Color"
			color_hex = rgb_to_hex(iterm_to_rgb(plist[color_key]))

			pallete_hex << color_hex
		end

		format_to_xshell(new_file, base_name, bg_hex, fg_hex, pallete_name, pallete_hex)
	end

end
