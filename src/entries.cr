require "csv"

class Entries 

    def self.display_entries(doro_file = "#{ENV["HOME"]}/.doro", num_entries = 10)
        csv_data = CSV.parse(File.open(doro_file))

        csv_data.each do |row|
            puts row
        end
    end

    def self.add_entry(
        doro_file = "#{ENV["HOME"]}/.doro",
        task_name = "none",
        minutes = 25,
        start_time = Time.now,
        tag = "untagged"
        )

        result = CSV.build do |csv|
            csv.row task_name, minutes, start_time.to_s, tag
        end

        File.open(doro_file, "a+") do |f|
            f.puts result
        end


    end
end