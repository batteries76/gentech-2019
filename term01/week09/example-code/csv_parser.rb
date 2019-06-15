module Parser
    class CSVParser 

        attr_reader(:raw_data, :parsed_data)

        def initialize(path)
            @raw_data = nil
            @parsed_data = nil
            csv_parser(path)
        end 

        def csv_parser(path)
            File.open(path, "r") do |f|
                array_of_arrays = []
                raw_data = ""
                
                f.each_line do |line|
                    raw_data += line

                    line_arr = line.split('')
                    line_arr.pop()
                    popped_string_line = line_arr.join
                    array_of_arrays << popped_string_line.split(',')
                end

                @raw_data = raw_data

                headers = array_of_arrays.shift
                array_of_hashes = []

                array_of_arrays.each do |data|
                    hash = {}
                    data.each_with_index do |data_item, index|
                        hash[headers[index].to_sym] = data_item
                    end
                    array_of_hashes << hash
                end

                @parsed_data = array_of_hashes
                # print array_of_hashes
                return array_of_hashes
            end
        end

    end

end
