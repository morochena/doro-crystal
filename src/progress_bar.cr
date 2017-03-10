require "./terminal-notifier"

class ProgressBar 
    def initialize(@title : String, @max_progress : Int32) 
        @progress = 0
        @start_time = Time.now 
        @interrupt = false
    end

    def start
        Signal::INT.trap { @interrupt = true }

        while (@progress < @max_progress && @interrupt == false)
            render_progress 
            @progress += 1 
            yield 
            sleep 1
        end

        print("\r")

        display_notification
    end 

    private def render_progress 
        print @title 
        print " ["
        print "=" * progress_bar_ticks
        print " " * remaining_bar_ticks
        print "] "
        print "\e[32m#{display_time}\e[0m"
        print "\r"
    end 

    private def display_time 

    end 

    private def progress_bar_ticks 
        (percent * (terminal_length - other_items_length)).to_i
    end

    private def remaining_bar_ticks 
        terminal_length - progress_bar_ticks - other_items_length
    end 

    private def other_items_length 
        @title.size + 10
    end

    private def terminal_length 
        return 80
    end

    private def percent
        @progress.to_f / @max_progress
    end 

    private def display_notification
        unless @interrupt
            TerminalNotifier.notify(@title)
        end
    end
end