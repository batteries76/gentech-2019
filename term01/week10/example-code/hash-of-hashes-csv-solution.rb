def read_data_file(filename)
    complete_data_hash = {}
    header_line = true
    headers = []
    File.open(filename, "r") do |f|
        f.each_line do |line_in_file|
            single_data_hash = {}
            if header_line
                headers = line_in_file.strip.split(',')
                header_line = false
            elsif
                split_line = line_in_file.strip.split(',')
                data_name = split_line[1]
                split_line.each_with_index do |item, index|
                    single_data_hash[headers[index].to_sym] = item
                end
                complete_data_hash[data_name.to_sym] = single_data_hash
            end
        end
    end
complete_data_hash
end