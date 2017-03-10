require "cli"
require "./doro_file"
require "./progress_bar"
require "./entries"

class CLI < Cli::Supercommand 
    VERSION = "0.1.0"
    command_name "doro"
    version VERSION

    command "start", default: true

    class Options        
        version 
        help 
    end

    class Start < Cli::Command 
        class Options 
            string "-t", var: "TAG", desc: "a tag to categorize the task", default: "default"
        end

        def run 
            DoroFile.check_existence

            raise "You didn't specify a task! \nUSAGE: doro start *task name here*" if nameless_args.empty?
            task_name = nameless_args.join(" ")
            start_time = Time.now 
            seconds = 0

            ProgressBar.new(task_name, 1500).start do 
                seconds += 1
            end

            Entries.add_entry(
                doro_file: "#{ENV["HOME"]}/.doro",
                task_name: task_name,
                minutes: seconds / 60,
                start_time: start_time, 
                tag: options.t
            )
        end
    end

    class List < Cli::Command 
        def run 
            DoroFile.check_existence
            Entries.display_entries
        end
    end

    class Break < Cli::Command 
        def run 
            DoroFile.check_existence
            ProgressBar.new("break", 300).start { }
        end
    end

    class Help 
        header "Minimalist CLI pomodoro app. Logs to ~/.doro."
        footer "(C) 2017 Marcus Orochena\nhttp://github.com/morochena/doro-crystal"
    end
end
