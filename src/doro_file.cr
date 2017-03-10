
class DoroFile 
    def self.check_existence
        unless File.exists?("#{ENV["HOME"]}/.doro") 
            File.write("#{ENV["HOME"]}/.doro", "")
        end
    end
end