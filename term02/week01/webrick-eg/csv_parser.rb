module CSVParser

    class CsvParser

        attr_reader(:raw_data, :parsed_data)
        
        def initialize(path)
            data_finder = csv_parser(path)
            @raw_data = data_finder[1]
            @parsed_data = data_finder[0]
        end

        def csv_parser(path) 

            File.open(path, "r") do |file|

                lines_array = []

                file.each_line do |line| 
                    array_line = line.strip().split(",")
                    lines_array << array_line
                end

                header_array = lines_array.shift()

                header_array.map! do |caps|
                    caps.downcase
                end

                hash_array = []
                                
                lines_array.each do |line_array|
                    data_hash = {}
                    line_array.each_with_index do |data, index|
                        data_hash[header_array[index].to_sym] = data
                    end
                    hash_array << data_hash
                end
                return [hash_array, lines_array]
            end
        end
    end
end