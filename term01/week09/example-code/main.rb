require_relative 'csv_parser.rb'

widget_data = Parser::CSVParser.new('./data.csv')
print widget_data.raw_data
print widget_data.parsed_data