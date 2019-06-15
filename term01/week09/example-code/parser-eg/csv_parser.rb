module Parsers
    class CSVParser 

        attr_reader(:parsed_data, :raw_data)
        
        def initialize(path)
            @raw_data = nil
            @parsed_data = nil
            csv_parser(path)
        end
        
        def csv_parser(path)
            File.open(path, "r") do |f|
                array_of_line_arrays = []
                raw_data = ""

                f.each_line do |line|
                    raw_data += line
                    array_line = line.split(',')
                    array_of_line_arrays << array_line  
                end

                @raw_data = raw_data
                # print array_of_line_arrays

                headers_arr = array_of_line_arrays.shift()

                hashes_in_array = []

                array_of_line_arrays.each do |line_arr|
                    data_hash = {}
                    line_arr.each_with_index do |data, index|
                        data_hash[headers_arr[index].to_sym] = data 
                    end
                    hashes_in_array << data_hash
                end
                # print hashes_in_array
                @parsed_data = hashes_in_array
            end
        end
    end
end
# csv_parser('./data.csv')

# widget = CSVParser.new('./data.csv')
# print widget.parsed_data