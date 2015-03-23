module ITerm2ToXShell
	class CLI < Thor	
		desc "convert", "Convert the iTerm2 Color Schemes to XShell format."
		method_option *AgileUtils::Options::BASE_DIR
		method_option *AgileUtils::Options::VERSION
		def convert
			opts = options.symbolize_keys
			if opts[:version]
				puts "iTerm2ToXShell version #{ITerm2ToXShell::VERSION}"
				exit
			end

			excute(opt)
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
		end
	end
end
