module ITerm2ToXShell
	class CLI < Thor	
		desc "convert", "Convert the iTerm2 Color Schemes to XShell format."
		method_option *AgileUtils::Options::BASE_DIR
		method_option *AgileUtils::Options::VERSION
		def convert
			opts = options.symbolize_keys
      # Explicitly add the :exts options
      opts[:exts] = %w[itermcolors]
			opts[:xcs_ext] = ".xcs"
			if opts[:base_dir].empty? || opts[:base_dir] == "" || opts[:base_dir] == "."
				opts[:base_dir] = Dir.pwd
			end
			opts[:xcs_dir] = opts[:base_dir]+"/xcscolors"

			if opts[:version]
				puts "iTerm2ToXShell version #{ITerm2ToXShell::VERSION}"
				exit
			end

			excute(opts)
		end

		desc "usage", "Display help screen"
		def usage
			puts <<-EOS	
Usage:
	iTerm2ToXShell [Options]
Options:
	-b, [--base-dir]	# Base directory
	-v, [--version]		# Version
			EOS
		end

		default_task :usage

		private
		def excute(options = {})
			#convert the iTerm2 Color schemes to XShell format
			#
			#create the xcs folder
			unless File.exist?(options[:xcs_dir])
				Dir.mkdir(options[:xcs_dir])
			end

      input_files = CodeLister.files(options)
      if input_files.empty?
        puts "No file found for your option: #{options}"
        return
      end
      FileUtils.chdir(options[:base_dir])
      input_files.each_with_index do |file, index|
        input_file = File.expand_path(file)
				to_xshell(file, options)
      end
		end
	end
end
